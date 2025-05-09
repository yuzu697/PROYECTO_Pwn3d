<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta charset="utf-8">
<link rel="icon" href="img/favicon.png">
<link rel="canonical" href="index.jsp">
<title>VulNyx | Offensive Security Playground</title>
<script async defer src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: sans, sans-serif;
}

body {
	background-color: #151515;
	color: #ffffff;
	min-height: 100vh;
}

header, footer {
	color: #ffffffa4;
	background-color: #262626;
}

code {
	padding: 0.15em 0.25em;
	border-radius: 0.25em;
	background: #daa04a;
}

pre {
	background: #c8574e;
	border-radius: 0.5rem;
}

.highlight {
	padding: 1rem;
}

a, a:link, a:visited {
	text-decoration: none;
	color: #ffffff;
}

a:hover {
	color: #86d6fc;
}

.active strong {
	color: #daa04a;
	text-decoration: underline;
}

a strong {
	color: #3fa8f4;
}

a strong:hover {
	opacity: 0.7;
}

header {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 1rem;
}

.header-container {
	width: 90vw;
	display: grid;
	grid-template-columns: 1fr 1fr;
}

#page-title {
	margin: auto;
	font-size: 1.15rem;
	text-align: center;
	color: #daa04a;
}

.project-info {
	display: flex;
	align-items: center;
	justify-content: end;
	gap: 1rem;
}

a.github-button {
	visibility: hidden;
}

#submit-vm, #submit-writeups {
	margin: 1.5rem 1.5rem 1rem 1.5rem;
}

.rules-list p {
	margin: 1rem 0;
}

h2+ul {
	line-height: 1.15rem;
}

.container {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	border-bottom: 1px solid #727272;
}

#vm-state {
	max-width: 85ch;
	line-height: 1.5rem;
	padding: 1rem;
}

#vm-state a {
	background: #c8574e;
	font-weight: bold;
	border-radius: 0.25em;
	padding: 2px 2px;
}

main {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin: 1rem;
}

.wrapper {
	width: 90vw;
}

.actions {
	width: 100%;
	display: grid;
	grid-template-columns: 1fr 1fr;
	align-items: center;
	margin-bottom: 1rem;
}

.vm-stats li {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	gap: 0.35rem;
}

.vm-stats button {
	background-color: inherit;
	border: none;
	cursor: pointer;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	gap: 0.35rem;
}

.vm-stats {
	list-style: none;
	display: flex;
	align-items: end;
	gap: 0.5rem;
}

.filters {
	position: relative;
	width: 100%;
	display: flex;
	align-items: end;
	justify-content: end;
	gap: 0.5rem;
}

#text-filter {
	text-align: center;
	color: #a4b1cd;
}

#text-filter {
	width: 100%;
}

.filter-options {
	display: none;
	position: absolute;
	top: 37px;
	background-color: black;
	border-radius: 0.25rem;
	padding: 0.5rem;
	z-index: 10;
}

.level-filter {
	display: flex;
	align-items: center;
	font-size: 14px;
	padding: 0.25rem 0;
	gap: 0.5rem;
}

.os-filter {
	display: flex;
	align-items: center;
	font-size: 14px;
	padding: 0.25rem 0;
	gap: 0.5rem;
}

.order-by {
	display: none;
}

.filter-by {
	display: flex;
	align-items: center;
	cursor: pointer;
	font-size: 1rem;
	border-radius: 0.25rem;
	padding: 0.5rem;
	border: none;
	background-color: #3fa8f41A;
	color: white;
}

.submit-btn, .submit-user-flag, .submit-root-flag {
	cursor: pointer;
	font-size: 1rem;
	border-radius: 0.25rem;
	padding: 0.5rem;
	border: none;
	background-color: #3fa8f43f;
	color: white;
}

.submit-user-flag, .submit-root-flag {
	padding: 0.35rem;
}

.level-filter:hover, .os-filter:hover, .filter-by:hover, .order-by:hover
	{
	/*background-color: rgba(0, 0, 0, 0.8); }*/
	background-color: #3fa8f4a8;
}

.submit-btn:hover, .submit-user-flag:hover, .submit-root-flag:hover {
	background-color: #3fa8f4a8;
}

#vm-search-wrapper {
	display: flex;
	background-color: #3fa8f41A;
	border-radius: 0.25rem;
}

#vm-search-wrapper:focus {
	outline-style: solid;
}

.search-icon {
	position: relative;
	left: 4px;
	top: 5px;
	width: fit-content;
}

.clear-search {
	display: none;
	position: absolute;
	right: 116px;
	padding: 0.15rem;
	border-radius: 0.25rem;
	cursor: pointer;
	border: 1px solid transparent;
	top: 6px;
}

#vm-search {
	padding: 0.5rem;
	border: none;
	color: white;
	background-color: transparent;
	font-size: 1rem;
	outline: none;
}

::-webkit-input-placeholder {
	color: inherit;
	opacity: 0.54;
}

#search-message {
	display: none;
	text-align: center;
	padding: 1em;
	font-size: 1.15rem;
	margin-top: 1.5rem;
}

#query {
	font-weight: bold;
	font-size: 1.25rem;
}

.creator, .size {
	text-align: left;
}

.first-flag, .size {
	text-align: center;
}

td.vvm-diffi, td.vvm-platf, td.vvm-curl, td.vvm-wal {
	text-align: center;
}

#vm-table-wrapper {
	border-radius: 0.25rem;
	max-height: calc(100vh - 205px);
	overflow-y: scroll;
}

#vm-table {
	width: 100%;
	margin: auto;
	border-collapse: separate;
	border-spacing: 0;
}

th, td {
	text-align: center;
	padding: 0 1rem;
}

td {
	height: 58px;
}

th {
	height: 64px;
	background-color: #262626;
	color: #ffffffa4;
	position: sticky;
	top: 0;
	z-index: 9;
}

.th-wrapper {
	display: flex;
	align-items: center;
	gap: 4px;
}

.tested {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 0.5rem;
}

.idnum {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 0.5rem;
}

tbody tr:nth-child(even) {
	background-color: rgba(30, 33, 37, 0.7);
}

tbody tr:nth-child(odd) {
	background-color: #1e2125;
}

#vm-table tr:hover {
	background-color: rgba(0, 0, 0, 0.5);
}

td div {
	display: flex;
	align-items: center;
	justify-content: center;
	list-style: none;
}

.card-btn {
	cursor: pointer;
	background-color: inherit;
	border: none;
}

.card-container {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 1rem;
	color: white;
}

.card-body-wrapper {
	border: 1px solid #cbc7c7;
	border-radius: 0.25rem;
	overflow: hidden;
}

.card-body {
	width: 100%;
	margin: auto;
	border-collapse: collapse;
	border-spacing: 0;
	font-size: 1rem;
}

.card-os {
	border: none;
}

#Linux, #Windows {
	width: 22px;
	height: 22px;
}

.card-creator, .card-difficulty, .card-release {
	border-top: 1px solid #cbc7c7;
}

#card-logo {
	position: relative;
	top: 0.5rem;
}

.card-os, .card-difficulty {
	display: flex;
	align-items: center;
}

.card-text {
	color: #c8cbcf;
}

.card-difficulty-text {
	margin-left: 0.5rem;
}

.card-icon-wrapper {
	width: 22px;
	margin: 0 0.5rem;
}

.card-info {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.card-info td {
	text-align: left;
}

.card-title {
	margin-bottom: 0.5rem;
}

.tags {
	color: white;
	font-weight: bold;
}

.md5 {
	position: relative;
}

#md5-hash {
	position: relative;
	left: 8px;
	top: 2px;
}

.copy-btn {
	cursor: pointer;
	position: relative;
	top: 11px;
	left: 8px;
	background-color: inherit;
	border: none;
}

.tooltip {
	visibility: hidden;
	position: absolute;
	bottom: 75%;
	left: 80%;
	transform: translateX(-50%);
	padding: 4px 8px;
	background-color: #333;
	color: #fff;
	border-radius: 4px;
	font-size: 12px;
	opacity: 0;
	transition: opacity 0.2s;
	z-index: 20;
}

details {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.writeup-btn, .add-writeup-btn {
	border: none;
	background-color: inherit;
	cursor: pointer;
}

.modal, .form-writeup, .form-vm, .form-flag {
	display: none;
	position: fixed;
	z-index: 10;
	padding-top: 45vh;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
}

.form-writeup, .form-vm, .form-flag, .modal {
	background-color: rgba(0, 0, 0, 0.6);
}

.modal {
	padding-top: 45vh;
	overflow: hidden;
}

.form-writeup, .form-flag {
	padding-top: 10vh;
	overflow: scroll;
}

.form-vm {
	padding-top: 5vh;
	overflow: scroll;
}

.modal-content {
	width: 300px;
	background-color: #141414;
	margin: auto;
	padding: 1rem;
	border: 1px solid #888;
	border-radius: 0.25rem;
}

.writeups-container {
	position: relative;
	bottom: 40px;
	display: flex;
	flex-direction: column;
	align-items: start;
	gap: 0.5rem;
}

.writeups-container a {
	color: #b2b5b9;
}

.writeups-container a:hover {
	color: #FFFF99;
}

.writeup-title {
	width: fit-content;
	margin-bottom: 0.25rem;
	position: relative;
	bottom: 47px;
	color: #3fa8f4a8;
	font-weight: bold;
}

.close {
	position: relative;
	bottom: 15px;
	left: 125px;
	width: 1.2em;
	height: 1.2em;
	color: #ccc;
	font-family: serif;
	font-size: 2.5em;
	line-height: 1.2;
	cursor: pointer;
}

.close-form {
	width: 100%;
	display: flex;
	justify-content: end;
	color: #ccc;
	font-family: serif;
	font-size: 2em;
	line-height: 1.2;
	cursor: pointer;
}

.close:hover, .close-form:hover {
	color: #f27474;
	cursor: pointer;
}

.logo-wrapper {
	display: flex;
	align-items: center;
	justify-content: start;
}

.logo {
	width: 160px;
	height: 24px;
}

.level-btn, .badge {
	border-radius: 0.25rem;
	color: white;
	font-weight: bold;
	font-size: 0.9rem;
}

.badge {
	padding: 0.5rem;
}

.level-btn {
	padding: 0.25rem;
}

.row.hidden {
	display: none;
}

.swal2-border {
	border: 1px solid #bbb !important;
}

.swal2-title {
	color: white !important;
}

.swal2-popup.swal2-toast, .swal2-close:focus {
	box-shadow: none !important;
}

.badge-easy, #Easy {
	color: #28a745;
	background-color: #28a7451a;
}

.easy {
	color: white;
	background-color: #28a7451a;
}

.vm-name-btn {
	display: grid;
	grid-template-columns: 0.1fr 1fr;
	gap: 12px;
}

.vm-name, .vm-name {
	text-align: left;
}

.low-dots, .easy-dots, .medium-dots, .hard-dots {
	width: 24px;
	height: 24px;
	padding: 0.15rem;
	border-radius: 50%;
}

.card-difficulty .low-dots, .card-difficulty .easy-dots,
	.card-difficulty .medium-dots, .card-difficulty .hard-dots {
	width: 16px;
	height: 16px;
	border-radius: 50%;
}

.easy-dots {
	background: #28a745;
}

#easy-vms {
	color: #28a745;
}

.badge-medium, #Medium {
	color: #e1b300;
	background-color: #e1b3001a;
}

.medium {
	color: white;
	background-color: #e1b3001a;
}

.medium-dots {
	background: #e1b300;
}

#medium-vms {
	color: #e1b300;
}

.badge-hard, #Hard {
	color: #ec0725;
	background-color: #ec07251a;
}

.hard {
	color: white;
	background-color: #ec07251a;
}

.hard-dots {
	background: #ec0725;
}

#hard-vms {
	color: #ec0725;
}

.badge-low, #Low {
	color: #00ffff;
	background-color: #00ffff1a;
}

.low {
	color: white;
	background-color: #00ffff1a;
}

.low-dots {
	background: #00ffff;
}

#low-vms {
	color: #00ffff;
}

.badge-vms {
	color: #b3da49;
	background-color: #b3da491a;
}

.badge-writeups {
	color: #daa04a;
	background-color: #daa04a1a;
}

#total-writeups, .submit-vm, .submit-writeup, .submit-flag {
	/*color: #daa04a; }*/
	color: #3fa8f4a8;
}

.media-info {
	width: 100%;
	padding: 0 0.5rem;
	display: grid;
	justify-content: end;
	margin-bottom: 1rem;
}

.media-links {
	display: flex;
	align-items: center;
	justify-content: start;
	gap: 1rem;
}

.media-links a:hover {
	transform: scale(1.1);
}

.form-container {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 1.5rem;
	flex-direction: column;
	background: #1e2125;
	border-radius: 0.25rem;
	padding: 2rem;
	width: 40vw;
	margin: auto;
}

.form-title {
	width: 100%;
	display: grid;
	grid-template-columns: 4fr 1fr;
	align-items: center;
	gap: 1rem;
	margin-bottom: 0.25rem;
}

.form-text {
	margin: 0;
	margin-bottom: 1rem;
	text-align: start;
	font-size: 0.85rem;
	width: 100%;
}

.form-section {
	display: flex;
	gap: 1rem;
}

.form-field {
	width: 100%;
	display: flex;
	align-items: start;
	justify-content: start;
	flex-direction: column;
	gap: 0.25rem;
}

.form-checkbox {
	display: flex;
	gap: 0.5rem;
}

.form-btns {
	display: flex;
	align-items: center;
	justify-content: start;
	gap: 0.5rem;
}

.form>div ~ div {
	margin-top: 20px;
}

.form-label {
	display: inline-block;
	margin-bottom: 5px;
	font-size: 0.875rem;
	font-weight: 700;
}

.form-control {
	display: block;
	width: 100%;
	padding: 10px;
	font: 0.875rem/1.5 sans-serif;
	color: #141414;
	background-color: lightgray;
	border: 1px solid #939598;
	border-radius: 4px;
	box-sizing: border-box;
}

.form-footer {
	display: flex;
	align-items: center;
	justify-content: start;
}

.submit-vm, .submit-writeup, .submit-flag {
	text-align: start;
	font-weight: bold;
	font-size: 1.15rem;
	margin: 0;
}

.submit-form {
	width: 100%;
	max-width: 90vw;
	/* padding: 2rem; */
	/* border-radius: 4px; */
	/* background-color: #1e2125; */
	/* border: 1px solid #daa04a; */
}

.button {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	padding: 5px 10px;
	font: 0.875rem/1.5 sans-serif;
	background-color: #ddd;
	border: 1px solid transparent;
	border-radius: 4px;
	cursor: pointer;
	box-sizing: border-box;
}

.button:hover {
	opacity: 0.7;
}

button[type="submit"] {
	color: white;
	background-color: #c8574e;
}

button[type="reset"] {
	background-color: #c8cbcf;
}

footer {
	position: sticky;
	top: 100vh;
	padding: 1rem;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 0.5rem;
}

footer p {
	text-align: center;
}

footer img {
	width: 25px;
	height: 25px;
}

#rules-warning {
	margin: 0 0 1rem 0;
}

.rules-heading {
	margin: 1.5rem 0;
}

.rules-list {
	padding: 0 1rem;
}

.rules-list .header-color {
	color: #3fa8f4;
}

.rules-list .text-color {
	color: #ec5353;
}

@media ( min-width : 320px) and (max-width: 700px) {
	header {
		display: flex;
		flex-direction: column;
		justify-content: center;
		gap: 0.5rem;
	}
	.logo {
		margin-top: 1rem;
	}
	.wrapper, .header-container, .form-container {
		width: 95vw;
	}
	.header-container {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		gap: 1.5rem;
	}
	.card, #card, .tested, #tested, .url, .md5, #md5, .first-user,
		.first-root, .first-flag, .skills, #skills, .size, .submit-btn,
		.add-writeup-btn {
		display: none;
	}
	#vm-search {
		width: 160px;
	}
	.clear-search {
		right: 4px;
		top: 8px;
		padding: 0.1rem;
		font-size: 0.8rem;
	}
	th, td, .level-btn, .badge {
		padding: 0.5rem;
		font-size: 0.85rem;
	}
	#page-title {
		font-size: 0.9rem;
		width: 40ch;
	}
	.actions {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 1.5rem;
	}
	.filters {
		align-items: center;
		justify-content: end;
	}
	.vm-stats, .filters {
		gap: 0.25rem;
	}
	.card-container {
		gap: 0;
	}
	#card-logo {
		top: 1rem;
		width: 150px;
		height: 150px;
	}
}

@media ( min-width : 700px) and (max-width: 812px) {
	#md5-hash {
		left: 0px;
		top: 16px;
	}
	.copy-btn {
		top: 0px;
		left: 25px;
	}
}

@media ( min-width : 1600px) {
	.wrapper, .header-container {
		width: 80vw;
	}
}
</style>
</head>

<body>
	<header>
		<section class="header-container">
			<!-- LOGO -->
			<article class="logo-wrapper">
				<img class="logo" alt="VulNyx website logo" src="img/logo.png">
			</article>
			<article class="project-info">
				<!-- RRSS -->
				<div class="media-links">
					<!-- KO-FI -->
					<a title="Support us on Ko-fi" href="https://ko-fi.com/vulnyx"
						target="_blank"> <img width="28" height="24" loading="lazy"
						src="https://storage.ko-fi.com/cdn/kofi_stroke_cup.svg"
						alt="Ko-fi Logo" loading="eager">
					</a>
					<!-- DISCORD -->
					<a title="Discord" href="https://discord.gg/qdm3bN3Emb"
						target="_blank"> <svg xmlns="http://www.w3.org/2000/svg"
							class="icon icon-tabler icon-tabler-brand-discord" width="24"
							height="24" viewBox="0 0 24 24" stroke-width="2" stroke="#5865F2"
							fill="none" stroke-linecap="round" stroke-linejoin="round">
                            <path stroke="none" d="M0 0h24v24H0z"
								fill="none" />
                            <circle cx="9" cy="12" r="1" />
                            <circle cx="15" cy="12" r="1" />
                            <path d="M7.5 7.5c3.5 -1 5.5 -1 9 0" />
                            <path d="M7 16.5c3.5 1 6.5 1 10 0" />
                            <path
								d="M15.5 17c0 1 1.5 3 2 3c1.5 0 2.833 -1.667 3.5 -3c.667 -1.667 .5 -5.833 -1.5 -11.5c-1.457 -1.015 -3 -1.34 -4.5 -1.5l-1 2.5" />
                            <path
								d="M8.5 17c0 1 -1.356 3 -1.832 3c-1.429 0 -2.698 -1.667 -3.333 -3c-.635 -1.667 -.476 -5.833 1.428 -11.5c1.388 -1.015 2.782 -1.34 4.237 -1.5l1 2.5" />
                        </svg>
					</a>
					<!-- LINKEDIN -->
					<a title="LinkedIn"
						href="https://www.linkedin.com/company/vulnyx-official/"
						target="_blank"> <svg xmlns="http://www.w3.org/2000/svg"
							class="icon icon-tabler icon-tabler-brand-linkedin" width="24"
							height="24" viewBox="0 0 24 24" stroke-width="1.5"
							stroke="#0077B5" fill="none" stroke-linecap="round"
							stroke-linejoin="round">
                            <path stroke="none" d="M0 0h24v24H0z"
								fill="none" />
                            <path
								d="M4 4m0 2a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2z" />
                            <path d="M8 11l0 5" />
                            <path d="M8 8l0 .01" />
                            <path d="M12 16l0 -5" />
                            <path d="M16 16v-3a2 2 0 0 0 -4 0" />
                        </svg>
					</a>
					<!-- INSTAGRAM -->
					<a title="Instagram"
						href="https://www.instagram.com/vulnyxofficial/" target="_blank">
						<svg xmlns="http://www.w3.org/2000/svg"
							class="icon icon-tabler icon-tabler-brand-instagram" width="24"
							height="24" viewBox="0 0 24 24" stroke-width="1.5"
							stroke="#F56040" fill="none" stroke-linecap="round"
							stroke-linejoin="round">
                            <path stroke="none" d="M0 0h24v24H0z"
								fill="none" />
                            <path
								d="M4 4m0 4a4 4 0 0 1 4 -4h8a4 4 0 0 1 4 4v8a4 4 0 0 1 -4 4h-8a4 4 0 0 1 -4 -4z" />
                            <path
								d="M12 12m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0" />
                            <path d="M16.5 7.5l0 .01" />
                        </svg>
					</a>
					<!-- X -->
					<a title="X" href="https://x.com/VulNyxOfficial" target="_blank">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" stroke-width="2" stroke="#ffffff" fill="none"
							stroke-linecap="round" stroke-linejoin="round">
                            <path d="M4 4l11.733 16h4.267l-11.733 -16z"></path>
                            <path
								d="M4 20l6.768 -6.768m2.46 -2.46l6.772 -6.772"></path>
                        </svg>
					</a>
					<!-- TELEGRAM -->
					<a title="Telegram" href="https://t.me/VulNyx" target="_blank">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="#27A7E7" stroke-width="2"
							stroke-linecap="round" stroke-linejoin="round">
                            <path
								d="M15 10l-4 4l6 6l4 -16l-18 7l4 2l2 6l3 -4" />
                        </svg>
					</a>
					<!-- MAIL -->
					<a title="Mail" href="mailto:hello@vulnyx.com" target="_blank">
						<svg xmlns="http://www.w3.org/2000/svg"
							class="icon icon-tabler icon-tabler-mail" width="24" height="24"
							viewBox="0 0 24 24" stroke-width="2" stroke="#8a90c7" fill="none"
							stroke-linecap="round" stroke-linejoin="round">
                            <path stroke="none" d="M0 0h24v24H0z"
								fill="none" />
                            <rect x="3" y="5" width="18" height="14"
								rx="2" />
                            <polyline points="3 7 12 13 21 7" />
                        </svg>
					</a>
					<!-- FEED/RSS -->
					<a title="RSS" href="https://vulnyx.com/feed/rss.xml"
						target="_blank"> <svg xmlns="http://www.w3.org/2000/svg"
							class="icon icon-tabler icon-tabler-rss" width="24" height="24"
							viewBox="0 0 24 24" stroke-width="1.5" stroke="#00b341"
							fill="none" stroke-linecap="round" stroke-linejoin="round">
                            <path stroke="none" d="M0 0h24v24H0z"
								fill="none" />
                            <path
								d="M5 19m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0" />
                            <path d="M4 4a16 16 0 0 1 16 16" />
                            <path d="M4 11a9 9 0 0 1 9 9" />
                        </svg>
					</a>
					<!-- SUBMIT VM -->
					<section class="form-vm">
						<article class="form-container">
							<div class="form-title">
								<h1 class="submit-vm">New VM Submission</h1>
								<span class="close-form">&times;</span>
							</div>
							<p class="form-text">Complete the form with all the
								information about your vm. If you want feedback about your
								upload, please contact us.</p>
							<form class="form submit-form" id="vmForm">
								<div class="form-section">
									<div class="form-field">
										<label class="form-label" for="name">Name</label> <input
											class="form-control" id="name" name="Name" type="text"
											maxlength="20" placeholder="Enter the machine name"
											required="" autocomplete="off">
									</div>
									<div class="form-field">
										<label class="form-label" for="vm-creator">Creator</label> <input
											class="form-control" id="vm-creator" name="Creator"
											type="text" maxlength="15" placeholder="Enter your username"
											required />
									</div>
								</div>
								<div class="form-section">
									<div class="form-field">
										<label class="form-label" for="level">Level</label> <select
											class="form-control" id="level" name="Level" required>
											<option value="Low">Low</option>
											<option value="Easy">Easy</option>
											<option value="Medium">Medium</option>
											<option value="Hard">Hard</option>
										</select>
									</div>
									<div class="form-field">
										<label class="form-label" for="vm-url">VM Url</label> <input
											class="form-control" id="vm-url" name="URL" type="url"
											pattern="https?://.+"
											placeholder="Enter the public url of your machine" required />
									</div>
								</div>
								<div class="form-section">
									<div class="form-field">
										<label class="form-label" for="user-flag">User Flag</label> <input
											class="form-control" id="user-flag" name="UserFlag"
											type="text" maxlength="32" placeholder="Enter the user flag"
											required />
									</div>
									<div class="form-field">
										<label class="form-label" for="root-flag">Root Flag</label> <input
											class="form-control" id="root-flag" name="RootFlag"
											type="text" maxlength="32" placeholder="Enter the root flag"
											required />
									</div>
								</div>
								<div class="form-section">
									<div class="form-field">
										<label class="form-label" for="writeup">Writeup Url</label> <input
											class="form-control" id="writeup-url" name="Solution"
											type="url" pattern="https?://.+"
											placeholder="Enter the public url of your writeup" required />
									</div>
									<div class="form-field">
										<label class="form-label" for="contact">Contact</label> <input
											class="form-control" id="contact" name="Contact" type="text"
											maxlength="32"
											placeholder="e.g. mail, linkedin, instagram, discord, twitter"
											required />
									</div>
								</div>
								<div class="form-field">
									<label class="form-label" for="tags">Tags</label>
									<textarea class="form-control" id="tags" name="Tags"
										maxlength="200" rows="1"
										placeholder="Indicate the main tags that identify the machine separated by commas."
										required></textarea>
								</div>
								<div class="form-btns">
									<button class="button" type="submit">Submit</button>
									<button class="button" type="reset">Clear</button>
								</div>
								<div class="form-footer">
									<small>Please read our <a
										href="https://vulnyx.com/rules/" target="_blank"> <strong>Rules</strong>
									</a> section before submitting a new vm.
									</small>
								</div>
							</form>
						</article>
					</section>
				</div>
			</article>
		</section>
	</header>
	<main>
		<section class="wrapper">
			<article class="actions">
				<!-- STATS -->
				<ul class="vm-stats">
					<li title="Total VMs"><span class="badge badge-vms">
							127 VMs </span></li>
					<li title="Low VMs"><span class="badge badge-low"> 32
							Low </span></li>
					<li title="Easy VMs"><span class="badge badge-easy"> 39
							Easy </span></li>
					<li title="Medium VMs"><span class="badge badge-medium">
							37 Medium </span></li>
					<li title="Hard VMs"><span class="badge badge-hard"> 19
							Hard </span></li>
					<li title="Total Writeups"><span class="badge badge-writeups">
							639 Writeups </span></li>
				</ul>
				<div class="filters">
					<div class="filter-wrapper" onmouseleave="hideFilters()">
						<button type="button" class="filter-by" onclick="toggleFilters()"
							onmouseover="showFilters()">
							Filter by
							<svg xmlns="http://www.w3.org/2000/svg"
								class="icon icon-tabler icon-tabler-chevron-down" width="20"
								height="20" viewBox="0 0 24 24" stroke-width="1.5"
								stroke="#ffffff" fill="none" stroke-linecap="round"
								stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z"
									fill="none" />
                                <path d="M6 9l6 6l6 -6" />
                            </svg>
						</button>
						<div class="filter-options">
							<div class="level-filter">
								<input type="checkbox" id="low" name="low" data-difficulty="low"
									title="Low" checked onclick="filterTable('low')" /> <label
									for="low">Low</label>
							</div>
							<div class="level-filter">
								<input type="checkbox" id="easy" name="easy"
									data-difficulty="easy" title="Easy" checked
									onclick="filterTable('easy')" /> <label for="easy">Easy</label>
							</div>
							<div class="level-filter">
								<input type="checkbox" id="medium" name="medium"
									data-difficulty="medium" title="Medium" checked
									onclick="filterTable('medium')" /> <label for="medium">Medium</label>
							</div>
							<div class="level-filter">
								<input type="checkbox" id="hard" name="hard"
									data-difficulty="hard" title="Hard" checked
									onclick="filterTable('hard')" /> <label for="hard">Hard</label>
							</div>
							<div class="os-filter">
								<input type="checkbox" id="linux" name="linux" data-os="linux"
									title="Linux" checked onclick="filterTable('linux')" /> <label
									for="linux">Linux</label>
							</div>
							<div class="os-filter">
								<input type="checkbox" id="windows" name="windows"
									data-os="windows" title="Windows" checked
									onclick="filterTable('windows')" /> <label for="windows">Windows</label>
							</div>
						</div>
					</div>
					<button type="button" class="order-by">
						Order by
						<svg xmlns="http://www.w3.org/2000/svg"
							class="icon icon-tabler icon-tabler-chevron-down" width="20"
							height="20" viewBox="0 0 24 24" stroke-width="1.5"
							stroke="#ffffff" fill="none" stroke-linecap="round"
							stroke-linejoin="round">
                            <path stroke="none" d="M0 0h24v24H0z"
								fill="none" />
                            <path d="M6 9l6 6l6 -6" />
                        </svg>
					</button>
					<div id="vm-search-wrapper">
						<div class="search-icon">
							<svg xmlns="http://www.w3.org/2000/svg"
								class="icon icon-tabler icon-tabler-search" width="24"
								height="24" viewBox="0 0 24 24" stroke-width="2.5"
								stroke="#999999" fill="none" stroke-linecap="round"
								stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z"
									fill="none" />
                                <path
									d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" />
                                <path d="M21 21l-6 -6" />
                            </svg>
						</div>
						<input id="vm-search" type="text" placeholder="Search by name..."
							aria-label="search" />
						<button class="clear-search" title="Clear search"
							onclick="clearSearch()">Clear</button>
					</div>
					<button type="button" class="submit-btn" onclick="showVMForm()">Submit
						VM</button>
				</div>
			</article>
			<div id="vm-table-wrapper">
				<table id="vm-table">
					<thead>
						<tr>
							<th id="idnum">#</th>
							<th id="card">Card</th>
							<th class="vm-name">Name</th>
							<th id="tested">Tested</th>
							<th class="url">File</th>
							<th class="size">Size</th>
							<th id="md5">MD5</th>
							<th class="first-user">First User</th>
							<th class="first-root">First Root</th>
							<th id="writeups">Writeups</th>
						</tr>
					</thead>
					<tbody>
						<script>
                            let writeupsArr = [];
                            let writeupObj = {};
                        </script>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">127</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Lower5',
                      'Linux',
                      'Low',
                      'd4t4s3c',
                      '09 Apr 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn low">
									<img class="low-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Lower5</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Lower5.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.8GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="65015966EDD9A1A8ACE257DA2F0D9730"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">suraxddq</td>
							<!-- FIRST ROOT -->
							<td class="first-user">suraxddq</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Lower5",
                                                    creator: "d4t4s3c",
                                                    url: "https://d4t4s3c.com/vulnyx/2025/04/09/Lower5/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower5",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1widPYcEVr"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Lower5')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Lower5'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Lower5" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">126</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Sandwich',
                      'Linux',
                      'Medium',
                      'Lenam',
                      '31 Mar 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn medium">
									<img class="medium-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Sandwich</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a
								href="https://vulnyx.com/file/Sandwich.php" target="_blank"
								title="Download VM"> <svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.1GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="CF3AF03D23D05CB33B6F9F8E3C4D7778"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">suraxddq</td>
							<!-- FIRST ROOT -->
							<td class="first-user">suraxddq</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Sandwich",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV18BZSYVEcc/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Sandwich",
                                                    creator: "suraxddq",
                                                    url: "https://byte-mind.net/vulnyx-machines-sandwich-writeup/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Sandwich",
                                                    creator: "he110wor1d",
                                                    url: "https://www.cnblogs.com/ShowMeTheBug/p/18810217"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Sandwich",
                                                    creator: "Primary",
                                                    url: "https://pepster.me/Vulnyx-Sandwich-Walkthrough/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Sandwich')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Sandwich'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Sandwich" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">125</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Loweb',
                      'Linux',
                      'Low',
                      'J4ckie0x17',
                      '16 Mar 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn low">
									<img class="low-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Loweb</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Loweb.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">796MB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="55A4FD238CE10D93D08BA5FD1C348F5B"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">suraxddq</td>
							<!-- FIRST ROOT -->
							<td class="first-user">suraxddq</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Loweb",
                                                    creator: "springx",
                                                    url: "https://github.com/h0day/PentestLab-AllHere/blob/main/VulNyx/Loweb.md"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Loweb",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV13dQaYjEu2"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Loweb",
                                                    creator: "triumph",
                                                    url: "https://www.bilibili.com/video/BV1b7QaYGE67"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Loweb",
                                                    creator: "hyh",
                                                    url: "https://www.hyhforever.top/vulnyx-loweb"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Loweb",
                                                    creator: "MatthyGD",
                                                    url: "https://www.youtube.com/watch?v=a3SLYt6lH-U"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Loweb",
                                                    creator: "Pentester95",
                                                    url: "https://github.com/dfalla/Vulnyx/blob/loweb/Loweb.md"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Loweb')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Loweb'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Loweb" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">124</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Lower4',
                      'Linux',
                      'Low',
                      'd4t4s3c',
                      '15 Mar 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn low">
									<img class="low-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Lower4</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Lower4.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.1GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="C6A4F2C7592B854001595CEB2B7A63E1"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">suraxddq</td>
							<!-- FIRST ROOT -->
							<td class="first-user">suraxddq</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Lower4",
                                                    creator: "d4t4s3c",
                                                    url: "https://d4t4s3c.com/vulnyx/2025/03/15/Lower4/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower4",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1dRQmYwEEi"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower4",
                                                    creator: "hyh",
                                                    url: "https://www.hyhforever.top/vulnyx-lower4"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower4",
                                                    creator: "alex14324",
                                                    url: "https://youtu.be/nmFIcxXSfyY?si=uAiQvboXke3cf6bJ"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower4",
                                                    creator: "Morii",
                                                    url: "https://blog.csdn.net/Tiny_Hacker/article/details/146324923"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower4",
                                                    creator: "Pentester95",
                                                    url: "https://github.com/dfalla/Vulnyx/blob/Lower4/Lower4.md"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Lower4')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Lower4'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Lower4" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">123</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Zerotrace',
                      'Linux',
                      'Medium',
                      'suraxddq',
                      '13 Mar 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn medium">
									<img class="medium-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Zerotrace</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a
								href="https://vulnyx.com/file/Zerotrace.php" target="_blank"
								title="Download VM"> <svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.4GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="57778873F1D5A6189820CD3AC9A7B58E"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">Lenam</td>
							<!-- FIRST ROOT -->
							<td class="first-user">Lenam</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Zerotrace",
                                                    creator: "PL4GU3",
                                                    url: "https://www.youtube.com/watch?v=H3m88BkM7R8"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Zerotrace",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1kwQSYjEdv"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Zerotrace",
                                                    creator: "MatthyGD",
                                                    url: "https://www.youtube.com/watch?v=Qak77P70Q-s"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Zerotrace",
                                                    creator: "alex14324",
                                                    url: "https://www.youtube.com/watch?v=OOf9Z3KpcC0"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Zerotrace",
                                                    creator: "Primary",
                                                    url: "https://pepster.me/Vulnyx-Zerotrace-Walkthrough/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Zerotrace')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Zerotrace'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Zerotrace" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">122</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Lower3',
                      'Linux',
                      'Low',
                      'd4t4s3c',
                      '09 Mar 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn low">
									<img class="low-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Lower3</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Lower3.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.2GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="CFD118EA4D1DE6C0B470A3BF54F49194"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">sublarge</td>
							<!-- FIRST ROOT -->
							<td class="first-user">maciiii___</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Lower3",
                                                    creator: "hyh",
                                                    url: "https://www.hyhforever.top/vulnyx-lower3"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower3",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV137QVY8E2B"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower3",
                                                    creator: "MatthyGD",
                                                    url: "https://www.youtube.com/watch?v=7TRETonYPH4"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower3",
                                                    creator: "Pentester95",
                                                    url: "https://github.com/dfalla/Vulnyx/blob/lower3/Lower3.md"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Lower3')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Lower3'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Lower3" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">121</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Change',
                      'Windows',
                      'Medium',
                      'd4t4s3c',
                      '08 Mar 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn medium">
									<img class="medium-dots" title="WindowsVM" alt="Windowsicon"
										src="img/Windows.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Change</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25">
							</td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Change.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">7.7GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="B11BED45EF5A1066C68FAE86F398D5CB"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">Flo2699</td>
							<!-- FIRST ROOT -->
							<td class="first-user">Flo2699</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Change",
                                                    creator: "d4t4s3c",
                                                    url: "https://d4t4s3c.com/vulnyx/2025/03/08/Change/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Change",
                                                    creator: "hyh",
                                                    url: "https://www.hyhforever.top/vulnyx-change"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Change",
                                                    creator: "PL4GU3",
                                                    url: "https://youtu.be/cfHYpcP5Tdc"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Change')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Change'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Change" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">120</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Lower2',
                      'Linux',
                      'Low',
                      'd4t4s3c',
                      '16 Feb 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn low">
									<img class="low-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Lower2</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Lower2.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.1GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="EC30B68C0135B25ED2467EB99B6C756D"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">Primary</td>
							<!-- FIRST ROOT -->
							<td class="first-user">ll104567</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Lower2",
                                                    creator: "d4t4s3c",
                                                    url: "https://d4t4s3c.com/vulnyx/2025/02/16/Lower2/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower2",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV13MAVedEdS"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower2",
                                                    creator: "Theo.H",
                                                    url: "https://blog.csdn.net/weixin_52710247/article/details/145670430?spm=1001.2014.3001.5501"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower2",
                                                    creator: "sunset",
                                                    url: "https://www.sunset-blog.top/baji/vulnyx/Lower%202.html"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower2",
                                                    creator: "TuxRoot",
                                                    url: "https://fascinated-aletopelta-7a3.notion.site/Lower-2-1a360a16f8a18000bac8daf35ff3185d?pvs=4"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower2",
                                                    creator: "alex14324",
                                                    url: "https://youtu.be/YlofFY4YSMc?si=PbQslBASBo0dgEwX"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower2",
                                                    creator: "Pentester95",
                                                    url: "https://github.com/dfalla/Vulnyx/blob/lower2/Lower2.md"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Lower2')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Lower2'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Lower2" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">119</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Bola',
                      'Linux',
                      'Medium',
                      'J4ckie0x17',
                      '07 Feb 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn medium">
									<img class="medium-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Bola</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Bola.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.2GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="0698EA4BB9314BD28F7EB9EC8DD8E3F7"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">qiaojojo</td>
							<!-- FIRST ROOT -->
							<td class="first-user">qiaojojo</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Bola",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1adNTejEUR"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Bola",
                                                    creator: "Sublarge",
                                                    url: "https://apex.xlog.app/Vulnyx-ba-chang-fu-pan---Bola"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Bola",
                                                    creator: "sunset",
                                                    url: "https://www.sunset-blog.top/baji/vulnyx/Bola%20194b61af428980369b1ccfd44632188a.html"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Bola",
                                                    creator: "J4ckie0x17",
                                                    url: "https://j4ckie0x17.gitbook.io/notes-pentesting/writeups/vulnyx/bola"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Bola",
                                                    creator: "alex14324",
                                                    url: "https://youtu.be/Q1_hFPzmY50?si=n5HzY0uHtsTcO_3E"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Bola')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Bola'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Bola" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">118</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Anon',
                      'Linux',
                      'Medium',
                      'd4t4s3c',
                      '05 Feb 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn medium">
									<img class="medium-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Anon</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Anon.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.5GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="74849CA997AA235CF3E47914F158024A"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">flower</td>
							<!-- FIRST ROOT -->
							<td class="first-user">lvzhouhang</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Anon",
                                                    creator: "suraxddq",
                                                    url: "https://byte-mind.net/vulnyx-machines-anon-writeup"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Anon",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1VhN7e5Ehw"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Anon",
                                                    creator: "PL4GU3",
                                                    url: "https://youtu.be/7VKb3Po7fd8"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Anon",
                                                    creator: "MatthyGD",
                                                    url: "https://www.youtube.com/watch?v=_YqXlvukKE0"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Anon",
                                                    creator: "sunset",
                                                    url: "https://www.sunset-blog.top/baji/vulnyx/Anon%20193b61af4289808d9254cfc427e4931b.html"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Anon')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Anon'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Anon" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">117</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Hit',
                      'Linux',
                      'Easy',
                      'd4t4s3c',
                      '04 Feb 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn easy">
									<img class="easy-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Hit</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Hit.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.2GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="75841477B83B8C86A6719F43B1A9A457"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">maciiii___</td>
							<!-- FIRST ROOT -->
							<td class="first-user">maciiii___</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Hit",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1m7NAedEuh"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Hit",
                                                    creator: "MatthyGD",
                                                    url: "https://www.youtube.com/watch?v=Lzrhk3O67YA"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Hit')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Hit'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Hit" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">116</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Matrix',
                      'Linux',
                      'Medium',
                      'Lenam',
                      '30 Jan 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn medium">
									<img class="medium-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Matrix</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Matrix.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">670MB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="7231B02B3C522DD4AE19917C13FB53F2"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">suraxddq</td>
							<!-- FIRST ROOT -->
							<td class="first-user">suraxddq</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Matrix",
                                                    creator: "MatthyGD",
                                                    url: "https://www.youtube.com/watch?v=fc6YmdAzP7s"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Matrix",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1escFeSEKM"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Matrix",
                                                    creator: "suraxddq",
                                                    url: "https://byte-mind.net/vulnyx-machines-matrix-writeup"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Matrix",
                                                    creator: "Lenam (EN)",
                                                    url: "https://len4m.github.io/posts/matrix-writeup-vulnyx-en"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Matrix",
                                                    creator: "Lenam (ES)",
                                                    url: "https://len4m.github.io/es/posts/matrix-writeup-vulnyx-es"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Matrix')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Matrix'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Matrix" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">115</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'APex',
                      'Linux',
                      'Easy',
                      'd4t4s3c',
                      '22 Jan 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn easy">
									<img class="easy-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">APex</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/APex.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.2GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="616D84A31B380C79CCEED4886E5448E2"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">suraxddq</td>
							<!-- FIRST ROOT -->
							<td class="first-user">ll104567</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "APex",
                                                    creator: "d4t4s3c",
                                                    url: "https://d4t4s3c.com/vulnyx/2025/01/22/APex/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "APex",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1wDfhYjEjA"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "APex",
                                                    creator: "MatthyGD",
                                                    url: "https://www.youtube.com/watch?v=5y-QgXvgt8A"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('APex')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'APex'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="APex" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">114</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Swamp',
                      'Linux',
                      'Easy',
                      'J4ckie0x17',
                      '05 Jan 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn easy">
									<img class="easy-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Swamp</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Swamp.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">871MB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="8D2BECEDDD3F121945FAB90A7EF74F03"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">ethicrash2</td>
							<!-- FIRST ROOT -->
							<td class="first-user">ethicrash2</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Swamp",
                                                    creator: "d4t4s3c",
                                                    url: "https://d4t4s3c.com/vulnyx/2025/01/05/Swamp/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Swamp",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1GGrVYqE9E"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Swamp",
                                                    creator: "J4ckie0x17",
                                                    url: "https://j4ckie0x17.gitbook.io/notes-pentesting/writeups/vulnyx/swamp"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Swamp",
                                                    creator: "MatthyGD",
                                                    url: "https://www.youtube.com/watch?v=xjvOM_WBEdQ"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Swamp')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Swamp'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Swamp" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">113</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Magic',
                      'Linux',
                      'Easy',
                      'd4t4s3c',
                      '02 Jan 2025'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn easy">
									<img class="easy-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Magic</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Magic.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.3GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="B6B13122D1645A576916AB9885C36BDD"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">suraxddq</td>
							<!-- FIRST ROOT -->
							<td class="first-user">suraxddq</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Magic",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1h96UYaEJt"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Magic",
                                                    creator: "suraxddq",
                                                    url: "https://byte-mind.net/vulnyx-machines-magic-writeup"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Magic",
                                                    creator: "ProxyProgrammer",
                                                    url: "https://www.youtube.com/watch?v=FRTs50UoWdU&t=634s"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Magic')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Magic'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Magic" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">112</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Blogger',
                      'Linux',
                      'Low',
                      'd4t4s3c',
                      '20 Dec 2024'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn low">
									<img class="low-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Blogger</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a
								href="https://vulnyx.com/file/Blogger.php" target="_blank"
								title="Download VM"> <svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.2GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="125978E3E27618DAC3E7BE4A7EDAAECB"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">ll104567</td>
							<!-- FIRST ROOT -->
							<td class="first-user">ll104567</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Blogger",
                                                    creator: "d4t4s3c",
                                                    url: "https://d4t4s3c.com/vulnyx/2024/12/20/Blogger/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Blogger",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1xvk2Y9Eyj"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Blogger",
                                                    creator: "beafn28",
                                                    url: "https://beafn28.gitbook.io/beafn28/writeups/vulnyx/blogguer"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Blogger",
                                                    creator: "Pentester95",
                                                    url: "https://github.com/dfalla/Vulnyx/blob/blogger/Blogger.md"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Blogger')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Blogger'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Blogger" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">111</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Lower',
                      'Linux',
                      'Low',
                      'd4t4s3c',
                      '15 Dec 2024'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn low">
									<img class="low-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Lower</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Lower.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.5GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="481D6E7DA68CFB6D1C72EDC3876819A4"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">suraxddq</td>
							<!-- FIRST ROOT -->
							<td class="first-user">suraxddq</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Lower",
                                                    creator: "d4t4s3c",
                                                    url: "https://d4t4s3c.com/vulnyx/2024/12/15/Lower/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower",
                                                    creator: "Hackingtomatico",
                                                    url: "https://hackingtomaticos.com/walkthrough-vulnyx-lower-machine-low"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1EakmY1EEz"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower",
                                                    creator: "beafn28",
                                                    url: "https://beafn28.gitbook.io/beafn28/writeups/vulnyx/lower"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower",
                                                    creator: "noname",
                                                    url: "https://0x-noname.github.io/writeups/nyx/lower"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Lower",
                                                    creator: "Pentester95",
                                                    url: "https://github.com/dfalla/Vulnyx/blob/lower/Lower.md"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Lower')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Lower'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Lower" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">110</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Tunnel',
                      'Linux',
                      'Hard',
                      'd4t4s3c',
                      '13 Dec 2024'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn hard">
									<img class="hard-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Tunnel</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Tunnel.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">2.0GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="3D5D92A73B8130FB1DEA281993A8F5FD"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">ll104567</td>
							<!-- FIRST ROOT -->
							<td class="first-user">ll104567</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Tunnel",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV16QBGYgE8A"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Tunnel",
                                                    creator: "MatthyGD",
                                                    url: "https://www.youtube.com/watch?v=JyQ7YVqDarc"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Tunnel')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Tunnel'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Tunnel" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">109</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'War',
                      'Windows',
                      'Easy',
                      'd4t4s3c',
                      '07 Dec 2024'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn easy">
									<img class="easy-dots" title="WindowsVM" alt="Windowsicon"
										src="img/Windows.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">War</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25">
							</td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/War.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">7.2GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="A48B73FBA9796957C86C19F8758CC9E5"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">minidump</td>
							<!-- FIRST ROOT -->
							<td class="first-user">minidump</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "War",
                                                    creator: "d4t4s3c",
                                                    url: "https://d4t4s3c.com/vulnyx/2024/12/07/War/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "War",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1bzqJYBEjf"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "War",
                                                    creator: "beafn28",
                                                    url: "https://beafn28.gitbook.io/beafn28/writeups/vulnyx/war"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('War')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'War'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="War" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">108</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Manager',
                      'Linux',
                      'Hard',
                      'd4t4s3c',
                      '29 Nov 2024'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn hard">
									<img class="hard-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Manager</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a
								href="https://vulnyx.com/file/Manager.php" target="_blank"
								title="Download VM"> <svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.8GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="EE5082F8354628AC353D9FEF6EB8784C"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">softyhack</td>
							<!-- FIRST ROOT -->
							<td class="first-user">ll104567</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Manager",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1uiznY7Eaj"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Manager",
                                                    creator: "pointedsec",
                                                    url: "https://pointedsec.github.io/writeups/manager---vulnyx"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Manager')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Manager'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Manager" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">107</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Fuser',
                      'Linux',
                      'Low',
                      'd4t4s3c',
                      '01 Nov 2024'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn low">
									<img class="low-dots" title="LinuxVM" alt="Linuxicon"
										src="img/Linux.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Fuser</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25"><img
								title="VMware" alt="VMware logo" src="img/vmware.png" width="25"
								height="25"></td>
							<!-- FILE -->
							<td class="url"><a href="https://vulnyx.com/file/Fuser.php"
								target="_blank" title="Download VM"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">1.1GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="B2CA3443F9660BF0DD13B6BEEFD7C1BC"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">suraxddq</td>
							<!-- FIRST ROOT -->
							<td class="first-user">suraxddq</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Fuser",
                                                    creator: "maciiii___",
                                                    url: "https://github.com/Maciferna/Writeups/blob/main/Vulnyx/maquina-fuser/maquina-fuser.md"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Fuser",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1xpDAYpE84"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Fuser",
                                                    creator: "beafn28",
                                                    url: "https://beafn28.gitbook.io/beafn28/writeups/vulnyx/fuser"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Fuser",
                                                    creator: "noname",
                                                    url: "https://0x-noname.github.io/writeups/nyx/fuser"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Fuser",
                                                    creator: "Pentester95",
                                                    url: "https://github.com/dfalla/Vulnyx/blob/fuser/Fuser.md"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Fuser')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Fuser'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Fuser" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
							<!-- # -->
							<td class="idnum"><span id="idnum">106</span></td>
							<!-- CARD -->
							<td class="card">
								<button class="card-btn" title="Show card!"
									onclick="showCard(
                      'Controler',
                      'Windows',
                      'Medium',
                      'd4t4s3c',
                      '23 Oct 2024'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-id" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="#3fa8f4"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M3 4m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v10a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                            <path
											d="M9 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M15 8l2 0" />
                                            <path d="M15 12l2 0" />
                                            <path d="M7 16l10 0" />
                                        </svg>
								</button>
							</td>
							<!-- NAME -->
							</td>
							<td id="vm">
								<div class="vm-name-btn level-btn medium">
									<img class="medium-dots" title="WindowsVM" alt="Windowsicon"
										src="img/Windows.svg" width="22" height="22" loading="lazy">
									<span class="vm-name">Controler</span>
								</div>
							</td>
							<!-- TESTED -->
							<td class="tested"><img title="VirtualBox"
								alt="VirtualBox logo" src="img/vbox.png" width="25" height="25">
							</td>
							<!-- FILE -->
							<td class="url"><a
								href="https://vulnyx.com/file/Controler.php" target="_blank"
								title="Download VM"> <svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-download" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#d9534f" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
                                            <path d="M7 11l5 5l5 -5" />
                                            <path d="M12 4l0 12" />
                                        </svg>
							</a></td>
							<!-- SIZE -->
							<td class="size"><span id="size">5.0GB</span></td>
							<!-- MD5 -->
							<td class="md5"><span id="md5-hash"
								title="73ECC9FD5D9CEC03A67124D9BE5A2151"> <svg
										xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-file-info" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path
											d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
                                            <path d="M11 14h1v4h1" />
                                            <path d="M12 11h.01" />
                                        </svg>
							</span>
								<button class="copy-btn" title="Copy to clipboard!"
									onclick="copyToClipboard(this)">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-copy" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#dad049" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                            <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                            <path
											d="M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z" />
                                            <path
											d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2" />
                                        </svg>
								</button>
								<div class="tooltip">Copied!</div></td>
							<!--  FIRST USER -->
							<td class="first-user">Rev3rKh1ll</td>
							<!-- FIRST ROOT -->
							<td class="first-user">Rev3rKh1ll</td>
							<!--  WRITEUPS -->
							<td class="writeups"><script>
                                                writeupObj = {
                                                    name: "Controler",
                                                    creator: "d4t4s3c",
                                                    url: "https://d4t4s3c.com/vulnyx/2024/10/23/Controler/"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Controler",
                                                    creator: "pointedsec",
                                                    url: "https://pointedsec.github.io/writeups/controler---vulnyx"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Controler",
                                                    creator: "ll104567",
                                                    url: "https://www.bilibili.com/video/BV1ZeqUYeEcj"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Controler",
                                                    creator: "J4ckie0x17",
                                                    url: "https://j4ckie0x17.gitbook.io/notes-pentesting/writeups/vulnyx/controler"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script> <script>
                                                writeupObj = {
                                                    name: "Controler",
                                                    creator: "miguel0x1985",
                                                    url: "https://github.com/miguellofredo85/PwnLabs/blob/main/Vulnyx/Controller%20AD.pdf"
                                                };
                                                writeupsArr.push(writeupObj);
                                            </script>
								<button class="writeup-btn" title="Show writeups"
									onclick="showWriteups('Controler')">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-book" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#b3da49" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <path
											d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0" />
                                                <line x1="3" y1="6"
											x2="3" y2="19" />
                                                <line x1="12" y1="6"
											x2="12" y2="19" />
                                                <line x1="21" y1="6"
											x2="21" y2="19" />
                                            </svg>
								</button>
								<button class="add-writeup-btn" title="Add writeup"
									onclick="showWriteupForm(
                      'Controler'
                    )">
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-tabler icon-tabler-circle-plus" width="22"
										height="22" viewBox="0 0 24 24" stroke-width="1.5"
										stroke="#49da57" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
                                                <path stroke="none"
											d="M0 0h24v24H0z" fill="none" />
                                                <path
											d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0" />
                                                <path d="M9 12h6" />
                                                <path d="M12 9v6" />
                                            </svg>
								</button>
								<section id="Controler" class="modal">
									<article class="modal-content">
										<span class="close">&times;</span>
										<p class="writeup-title"></p>
										<div class="writeups-container"></div>
									</article>
								</section></td>
						<tr class="row">
					</tbody>
				</table>
				<p id="search-message">
					No matches for <span id="query"></span>. Try with other search.
				</p>
			</div>
			<section class="form-writeup">
				<article class="form-container">
					<div class="form-title">
						<p class="submit-writeup"></p>
						<span class="close-form">&times;</span>
					</div>
					<p class="form-text">Complete all fields in the form with the
						information from your report. After review, if the report meets
						our submission rules, the article will be publicly available on
						the website for any user.</p>
					<form class="form submit-form" id="writeupForm">
						<div class="form-field">
							<label class="form-label" for="writeup-creator">Creator</label> <input
								class="form-control" id="writeup-creator" name="Creator"
								type="text" maxlength="15" placeholder="Enter your username"
								required />
						</div>
						<div class="form-field">
							<label class="form-label" for="writeup-url">URL</label> <input
								class="form-control" id="writeup-url" name="URL" type="url"
								pattern="https?://.+"
								placeholder="Enter the public url of your writeup" required />
						</div>
						<div class="form-field">
							<span class="form-label">Content Type</span>
							<div class="form-checkbox" id="content-type">
								<input type="radio" id="text" name="ContentType" value="Text"
									checked> <label for="text">Text</label> <input
									type="radio" id="video" name="ContentType" value="Video">
								<label for="video">Video</label>
							</div>
						</div>
						<div class="form-field">
							<label class="form-label" for="language">Language</label> <select
								class="form-control" id="language" name="Language" required>
								<option value="EN">English</option>
								<option value="ES">Español</option>
								<option value="FR">Français</option>
								<option value="DE">Deutsch</option>
								<option value="PT">Português</option>
								<option value="ZH">Chinese</option>
								<option value="Other">Other</option>
								<option value="None">None(Just Video)</option>
							</select>
						</div>
						<div class="form-field">
							<label class="form-label" for="opinion">Opinion
								(Optional)</label>
							<textarea class="form-control" id="opinion" name="Opinion"
								maxlength="2000" rows="2"
								placeholder="Your opinion will only be shared with the VulNyx team and will be helpful as feedback. You are free to review or rate the machine as you want."></textarea>
						</div>
						<div class="form-btns">
							<button class="button" type="submit">Submit</button>
							<button class="button" type="reset">Clear</button>
						</div>
						<div class="form-footer">
							<small>Please read our <a
								href="https://vulnyx.com/rules/" target="_blank"> <strong>Rules</strong>
							</a> section before submitting a new writeup.
							</small>
						</div>
					</form>
				</article>
			</section>
			<section class="form-flag">
				<article class="form-container">
					<div class="form-title">
						<p class="submit-flag"></p>
						<span class="close-form">&times;</span>
					</div>
					<form class="form submit-form" id="flagForm">
						<div class="form-field">
							<label class="form-label" for="username">Username</label> <input
								class="form-control" id="username" name="Username" type="text"
								maxlength="15" placeholder="Enter your username" required=""
								autocomplete="username">
						</div>
						<div class="form-field">
							<label class="form-label" for="flag">Flag</label> <input
								class="form-control" id="flag" name="Flag" type="text"
								maxlength="32" placeholder="Enter the flag" required />
						</div>
						<div class="form-btns">
							<button class="button" type="submit">Submit</button>
							<button class="button" type="reset">Clear</button>
						</div>
						<div class="form-footer">
							<small>As this is a static page, the information is not
								automatically updated, so you may not be the first to send it,
								we apologise in advance. </small>
						</div>
					</form>
				</article>
			</section>
		</section>
	</main>
	<footer>
		<img src="img/logoSM.png" alt="VulNyx small footer logo"
			loading="lazy">
		<p>© VulNyx 2023-2025</p>
	</footer>
	<script>
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

    /* SEARCH */
    const clearSearch = () => {
        const searchBox = document.querySelector('#vm-search');
        const clearSearch = document.querySelector('.clear-search');
        clearSearch.style.display = 'none';
        searchBox.value = '';
        location.hash = '';
    }

    const toggleFilters = () => {
        let filtersDiv = document.querySelector('.filter-options');
        filtersDiv.style.display = filtersDiv.style.display === 'block' ? 'none' : 'block';
    }

    const filter = (query) => {
        const queryArray = query.toLowerCase().trim().split(/ *\+/);
        const [vmPattern, ...functionPatterns] = queryArray;

        let noResults = true;
        document.querySelectorAll('#vm-table tbody tr').forEach((row) => {
            let show = true;

            const vmName = row.querySelector('.vm-name')?.innerText?.toLowerCase();
            if (!vmName?.includes(vmPattern)) {
                show = false;
            }

            row.style.display = show ? '' : 'none';
            noResults = noResults && !show;
        });

        const searchMessage = document.querySelector('#search-message');
        const searchBox = document.querySelector('#vm-search');
        const queryElem = document.querySelector('#query');
        queryElem.textContent = searchBox.value;
        searchMessage.style.display = noResults ? 'block' : 'none';
    }

    const applyFilter = () => {
        const searchBox = document.querySelector('#vm-search');
        const query = decodeURIComponent(location.hash.slice(1));
        searchBox.value = query
        filter(query);
    }

    const setup = () => {
        const searchBox = document.querySelector('#vm-search');
        const clearSearch = document.querySelector('.clear-search');

        searchBox.addEventListener('input', () => {
            clearSearch.style.display = searchBox.value ? 'block' : 'none';
            let query = searchBox.value;
            history.replaceState(null, null, encodeURI(`#${query}`));
            applyFilter();
        });

        searchBox.addEventListener('keydown', (event) => {
            if (event.key === 'Escape') {
                location.hash = searchBox.value = '';
                clearSearch.style.display = searchBox.value ? 'block' : 'none';
            }
        });

        window.onhashchange = applyFilter;
        applyFilter();
    }

    setup();

    </script>
</body>
</html>