$(function () {
    $('#custom-table').DataTable({
        "lengthMenu": [[5, 10, 25, 50], [5, 10, 25, 50, "All"]],
        "language": {
            "lengthMenu": "Hiển thị _MENU_ bản ghi trên mỗi trang",
            "info": "Hiển thị trang _PAGE_ trên _PAGES_",
        }
    });
});