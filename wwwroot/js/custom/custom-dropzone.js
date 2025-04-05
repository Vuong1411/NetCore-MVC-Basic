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
                thumbnail.style.width = "100%"; // Hiển thị full chiều rộng
                thumbnail.style.height = "auto"; // Tự động điều chỉnh chiều cao
                thumbnail.style.objectFit = "contain"; // Giữ tỷ lệ ảnh
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
    }
});