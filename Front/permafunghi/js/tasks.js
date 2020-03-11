document.addEventListener('DOMContentLoaded', function(){

    let targetURL = "http://192.168.0.100:83/api/todoes/filter/filtered?";
    let xhr = new XMLHttpRequest();

    xhr.addEventListener('readystatechange', function(e) {
        if(this.readyState == 4 && this.status == 200) {
            let json = JSON.parse(this.responseText);
            console.log(json);
                

            let tasks = document.querySelector(".tasks-list");


            for(let i = 0; i < json.length; i++){


                // parent
                let task = document.createElement("div");
                task.setAttribute('class', 'task');

                // enfant1 div.task
                let title = document.createElement("div");
                title.setAttribute('class', 'title');

                // div.task enfants
                    // h2
                    let h2 = document.createElement("h2");
                    // p
                    let ptitle = document.createElement("p");

                // enfant2 div.more-info
                let infos = document.createElement("div");
                infos.setAttribute('class', 'more-info spec');
                    // div1 in/end
                    let div1 = document.createElement("div");
                    let div1a = document.createElement("div");
                let div1b = document.createElement("div");
                let p1 = document.createElement("p");
                let span1 = document.createElement("span");
                let p2 = document.createElement("p");
                let span2 = document.createElement("span");
                let div2 = document.createElement("div");
                let buttonLets = document.createElement("button");
                buttonLets.setAttribute('data-id', json[i].prioritiy.id);

                h2.textContent = json[i].name;
                ptitle.innerHTML = "<i class='far fa-question-circle'></i>";

                span1.textContent = "in:";
                span2.textContent = "start:";

                p1.textContent = json[i].site.name.toLowerCase();
                p2.textContent = json[i].dateStart;

                buttonLets.textContent = "let's do it";


                tasks.appendChild(task);

                task.appendChild(title);
                task.appendChild(infos);
                infos.appendChild(div1);
                infos.appendChild(div2);

                title.appendChild(h2);
                title.appendChild(ptitle);

                div1.appendChild(p1);
                div1.appendChild(div1a);
                div1a.appendChild(span1);
                div1a.appendChild(p1);

                div1.appendChild(div1b);
                div1b.appendChild(span2);
                div1b.appendChild(p2);


                div2.appendChild(buttonLets);

        
                ptitle.addEventListener('click', function(e) {

                    let currentTask = e.currentTarget.parentNode.parentNode;
                    let currentTaskSecondChild = currentTask.children[1];
            
                    console.log(currentTask);
                    console.log(currentTaskSecondChild);

                    let hiddenContent = document.createElement('div');
                    hiddenContent.setAttribute('class', 'more-info');
                    let description = document.createElement('div');
                    let d1 = document.createElement('span');
                    let d2 = document.createElement('p');

                    d1.textContent = "description: ";
                    d2.textContent = json[i].description;
                    

                    let category = document.createElement('div');
                    let c1 = document.createElement('span');
                    let c2 = document.createElement('p');

                    c1.textContent = "category: ";
                    c2.textContent = json[i].categorie.name;

                    let author = document.createElement('div');
                    let a1 = document.createElement('span');
                    let a2 = document.createElement('p');

                    a1.textContent = "author: ";
                    a2.textContent = json[i].author.firstName + " " + json[i].author.lastName;

                    while(currentTask.children.length < 3){
        
                        hiddenContent.appendChild(description);
                        description.appendChild(d1);
                        description.appendChild(d2);
                        hiddenContent.appendChild(category);
                        category.appendChild(c1);
                        category.appendChild(c2);
                        hiddenContent.appendChild(author);
                        author.appendChild(a1);
                        author.appendChild(a2);


                        currentTask.insertBefore(hiddenContent, currentTaskSecondChild);
            
                    }

                    if(currentTask.children.length == 3) {
                        e.currentTarget.addEventListener('click', function(){
                            currentTask.removeChild(hiddenContent); 
                        });
                    
                    }

                    buttonLets.addEventListener('click', function() {

                        console.log("coucou")
                    })


                    
                });

            }


            


        }

    })
    
    xhr.open('GET', targetURL, true);
    xhr.send();


})