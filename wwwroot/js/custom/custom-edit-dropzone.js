Dropzone.autoDiscover = false;

// Khởi tạo Dropzone
const dropzone = new Dropzone("#dropzone-area", {
    url: "#",
    autoProcessQueue: false,
    uploadMultiple: true,
    addRemoveLinks: true,
    dictRemoveFile: "Xóa ảnh",
    dictDefaultMessage: "Kéo thả file vào đây hoặc nhấn để chọn file",
    clickable: true,
    thumbnailWidth: null, // Không giới hạn chiều rộng thumbnail
    thumbnailHeight: null, // Không giới hạn chiều cao thumbnail
    init: function () {
        const inputFile = document.querySelector("#productImages");
        const myDropzone = this;

        // Khi file được thêm vào Dropzone
        this.on("addedfile", function (file) {
            updateInputFiles();
            const progress = file.previewElement.querySelector(".dz-progress");
            progress.style.display = "none";
        });

        // Khi file bị xóa khỏi Dropzone
        this.on("removedfile", function (file) {
            updateInputFiles();
        });

        // Khi thumbnail được tạo
        this.on("thumbnail", function (file, dataUrl) {
            // Đảm bảo ảnh hiển thị đầy đủ
            const thumbnail = file.previewElement.querySelector(".dz-image img");
            if (thumbnail) {
                thumbnail.style.width = "100%";
                thumbnail.style.height = "auto";
                thumbnail.style.objectFit = "contain";
            }
        });

        // Hàm đồng bộ file từ Dropzone sang input
        function updateInputFiles() {
            const dataTransfer = new DataTransfer();
            myDropzone.files.forEach(file => {
                dataTransfer.items.add(file);
            });
            inputFile.files = dataTransfer.files;
        }

        // Tải ảnh cũ khi DOM ready
        document.addEventListener("DOMContentLoaded", async function () {

            window.existingFiles = existingFiles;
            if (Array.isArray(existingFiles)) {
                const filePromises = existingFiles.map(async (fileName, index) => {
                    try {
                        const fileUrl = `/img/products/${fileName}`;
                        const response = await fetch(fileUrl);
                        const blob = await response.blob();
                        const file = new File([blob], fileName, { type: blob.type });

                        // Thêm file vào Dropzone
                        myDropzone.emit("addedfile", file);
                        myDropzone.emit("thumbnail", file, fileUrl);
                        myDropzone.emit("complete", file);

                        // Ẩn thanh progress
                        const progress = file.previewElement.querySelector(".dz-progress");
                        if (progress) {
                            progress.style.display = "none";
                        }

                        return file;
                    } catch (error) {
                        console.error(`Lỗi khi tải ảnh từ /img/products/${fileName}:`, error);
                        return null;
                    }
                });
                const files = (await Promise.all(filePromises)).filter(f => f !== null);

                files.forEach(file => {
                    if (!myDropzone.files.includes(file)) {
                        myDropzone.files.push(file);
                    }
                });
                updateInputFiles();
            }
            
        });
    }
});