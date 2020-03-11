document.addEventListener("DOMContentLoaded", function(){
    
    let button = document.querySelector('.closed-window');
    let div = document.querySelector('.opened-window');

    $(document).ready(function(){
        $(button).click(function(){
            $(div).slideToggle(".2");
        });
    });


    

    function openModalWindow(e) {

        console.log("ok")
        // let modalWindowContent = e.currentTarget.parentNode.parentNode.parentNode.children[0].children[0]
        // console.log(modalWindowContent);

        // let modalDiv = document.querySelector('.modal-window');
        // let modalWindow = document.querySelector('.modal-window p');
        // console.log(modalWindow);

        // modalDiv.style.display = 'block';
        // modalWindow.textContent = `Are you sure to achieve ${modalWindowContent}?`;

    }


    // appel fonctions
    for(let i = 0; i < buttonLetsDoIt.length; i++){

        buttonLetsDoIt[i].addEventListener('click', openModalWindow);

    }



})