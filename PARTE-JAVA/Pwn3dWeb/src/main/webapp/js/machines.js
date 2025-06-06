/* SHOW CARD */
	function showCard(name, os, difficulty, creator, release) {
	    Swal.fire({
	        background: '#141414',
	        width: '36rem',
	        customClass: 'swal2-border',
	        padding: '3rem 0',
	        html: 
	        '<article class="card-container">' +
	            '<div class="logo-wrapper">' +
	                '<img id="card-logo" src="/img/card.png" alt="VulNyx Logo" width="250" height="250">' +
	            '</div>' +
	            '<div class="card-info">' +
	                '<h1 class="card-title">' + name + '</h1>' +
	                '<div class="card-body-wrapper">' +
	                    '<table class="card-body">' +
	                        '<tbody>' +
	                            '<tr>' +
	                                '<td class="card-os">' +
	                                    '<span class="card-text">OS:</span>' +
	                                    '<span class="card-icon-wrapper">' +
	                                        '<img id="' + os + '" src="/img/' + os + '.svg" alt="' + os + '">' +
	                                    '</span>' +
	                                    os +
	                                '</td>' +
	                            '</tr>' +
	                            '<tr>' +
	                                '<td class="card-creator">' +
	                                    '<span class="card-text">Creator:</span>' +
	                                    '<span>' + creator + '</span>' +
	                                '</td>' +
	                            '</tr>' +
	                            '<tr>' +
	                                '<td class="card-difficulty">' +
	                                    '<span class="card-text">Difficulty:</span>' +
	                                    '<div class="card-difficulty-text vm-name-btn level-btn ' + difficulty.toLowerCase() + '">' +
	                                        '<span class="' + difficulty.toLowerCase() + '-dots"></span>' +
	                                        '<span class="vm-name">' + difficulty + '</span>' +
	                                    '</div>' +
	                                '</td>' +
	                            '</tr>' +
	                            '<tr>' +
	                                '<td class="card-release">' +
	                                    '<span class="card-text">Release:</span> ' + release +
	                                '</td>' +
	                            '</tr>' +
	                        '</tbody>' +
	                    '</table>' +
	                '</div>' +
	            '</div>' +
	        '</article>',
	        showConfirmButton: false,
	        showCloseButton: true
	    });
	}

    /* COPY MD5 */
    function copyToClipboard(button) {
        const md5HashElement = button.previousElementSibling;
        const md5Hash = md5HashElement.getAttribute('title');
        navigator.clipboard.writeText(md5Hash);

        const tooltip = button.nextElementSibling;
        tooltip.style.visibility = 'visible';
        tooltip.style.opacity = '1';
        setTimeout(() => {
            tooltip.style.visibility = 'hidden';
            tooltip.style.opacity = '0';
        }, 2000);
    }

    /* FILTER TABLE */
    const showFilters = () => setFilterDisplay('block');
    const setFilterDisplay = (display) => {
        const filtersDiv = document.querySelector('.filter-options');
        filtersDiv.style.display = display;
    }
    const hideFilters = () => setTimeout(() => setFilterDisplay('none'), 200);

    function filterTable(filter) {
        let rows = document.getElementById('vm-table').getElementsByTagName('tr');
        let checkbox = document.getElementById(filter);
        let isChecked = checkbox.checked;

        let difficultyFilters = ['low', 'easy', 'medium', 'hard'];
        let osFilters = ['linux', 'windows'];

        let activeDifficulties = difficultyFilters.filter(d => document.getElementById(d).checked);
        let activeOS = osFilters.filter(os => document.getElementById(os).checked);

        for (let i = 1; i < rows.length; i++) {
            let row = rows[i];
            let vmCell = row.querySelector('.vm-name-btn');
            let osImg = row.querySelector('.vm-name-btn img');

            let difficultyMatch = activeDifficulties.length === 0 ||
                activeDifficulties.some(d => vmCell.classList.contains(d));

            let osMatch = activeOS.length === 0 ||
                (osImg && osImg.title && activeOS.some(os => osImg.title.toLowerCase().includes(os)));

            row.style.display = (difficultyMatch && osMatch) ? '' : 'none';
        }

        checkbox.classList.toggle('hidden', !isChecked);
    }
	
    /* SUBMIT VM (SHOW FORM) */
    const showVMForm = () => {
        document.querySelector('body').style.overflow = 'hidden';
        let title = document.querySelector('.submit-writeup');
        let modal = document.querySelector('.form-vm');
        modal.style.display = 'block';

        let span = modal.querySelector('.close-form');
        span.onclick = function() {
            modal.style.display = 'none';
            document.querySelector('body').style.overflow = 'visible';
        }
    }

    
    /* SHOW WRITEUPS */
    function showWriteups(name) {
        document.querySelector('body').style.overflow = 'hidden';
        let modal = document.getElementById(name);
        let title = modal.querySelector('.writeup-title');
        title.textContent = "Writeups for " + name;
        let writeupsContainer = modal.querySelector('.writeups-container');
        let span = modal.querySelector('.close');
        modal.style.display = 'block';

        span.onclick = function() {
            modal.style.display = 'none';
            document.querySelector('body').style.overflow = 'visible';
        }

        if (writeupsContainer.childElementCount === 0) {
            let output = writeupsArr.filter(el => el.name === name);
            output.forEach(el => {
                let link = document.createElement('a');
                link.id = "writeup";
                link.href = el.url;
                link.target = '_blank';
                link.textContent = "by " + el.creator;
                writeupsContainer.appendChild(link);
            });
        }
    }

    /* SUBMIT WRITEUP (SHOW FORM) */
    const showWriteupForm = (name) => {
        document.querySelector('body').style.overflow = 'hidden';
        let title = document.querySelector('.submit-writeup');
        title.textContent = "Writeup submission for " + name;
        let modal = document.querySelector('.form-writeup');
        modal.style.display = 'block';

        let span = modal.querySelector('.close-form');
        span.onclick = function() {
            modal.style.display = 'none';
            document.querySelector('body').style.overflow = 'visible';
        };
    }
 	
    /* SUBMIT FLAGS (SHOW FORM) */
    const showFlagForm = (type, vmname) => {
        const body = document.querySelector('body');
        const title = document.querySelector('.submit-flag');
        const modal = document.querySelector('.form-flag');
        const span = modal.querySelector('.close-form');

        if (body && title && modal && span) {
            body.style.overflow = 'hidden';
            title.textContent = `First ${type} flag submission for ${vmname}`;
            modal.style.display = 'block';

            span.onclick = function() {
                modal.style.display = 'none';
                body.style.overflow = 'visible';
            };
        } else {
            console.error('Error: one or more elements not found.');
        }
    }