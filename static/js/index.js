new Vue({
    el: '#Page',
    computed: {
        VersionName() {
            return this.Version ? 'V' + this.Version : '';
        }
    },
    created() {
        fetch('https://api.github.com/repos/Jerrylum/GaiasVault/releases')
        .then((response) => response.json())
        .then((info) => this.HandleGitHubReleaseInfo(info));      
    },
    methods: {
        HandleGitHubReleaseInfo(info) {   
            if (info.message === 'Not Found') return;

            const latestRelease = info.sort((a, b) => a.created_at > b.created_at)[0];
            const latestAssests = latestRelease.assets;

            this.Version = latestRelease.tag_name;

            if (latestAssests.length != 1)
                this.GitHubMapLink = latestRelease.html_url;
            else
                this.GitHubMapLink = latestAssests[0].browser_download_url;
        }
    },
    data: {
        GitHubMapLink: 'https://github.com/Jerrylum/GaiasVault/releases/',
        Version: ''
    }
});