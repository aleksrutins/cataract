{ pkgs, siteConfig, content }:
pkgs.writeText "site-toc.html" ''
<nav>
<h1 id="site-title">${siteConfig.title}</h1>

${builtins.map (section: ''
  <nav-section>${section.title}</nav-section>
  ${builtins.map (link: ''
    <nav-link url="${link.path}">${link.text}</nav-link>
  '') section.links}
'') siteConfig.toc}

</nav>

<style>
    :host {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
        padding: 5px;
        padding-left: 5%;
        background-color: #f6f6f7;

        box-sizing: border-box;

        position: sticky;
        top: 0;
        height: 100vh;
        min-width: fit-content;
    }

    nav {
        padding-right: 1.5em;
    }

    h1#site-title {
        border-bottom: 1px solid #aaa;
        padding: 5px;
        text-align: center;
    }
</style>
''