Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eDIyY-0005Gy-TO
	for mharc-qemu-trivial@gnu.org; Fri, 10 Nov 2017 18:44:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eDIyW-0005FR-Dv
	for qemu-trivial@nongnu.org; Fri, 10 Nov 2017 18:44:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eDIyV-0003Sk-LV
	for qemu-trivial@nongnu.org; Fri, 10 Nov 2017 18:44:40 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:64175)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eDIyR-0003Ok-1v; Fri, 10 Nov 2017 18:44:35 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue101 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0MCZWc-1eLWRv1PRy-009N15; Sat, 11 Nov 2017 00:44:25 +0100
To: Zach Riggle <zachriggle@gmail.com>
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <fac44468-7869-57fa-fb5f-fbd98828489f@vivier.eu>
Date: Sat, 11 Nov 2017 00:44:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171025033442.44872-1-zachriggle@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:rK6ESUEc7Cu1mEVckM0cZG3wrEMpcU0nwxUVHKKSa9VD6AfG8BT
	Qme19E35LK8ou1osRHczmFMq8f7BcfQn47Qs7xKp3LappiTqUojo93FQkeXPuGyUkI5bSCL
	+Fr8S33e6wwxIm1xLHKA8ysAesqZnHn34iLx66+HTq9BoAd70VxV9EckT+ZHheCXx1oyX5G
	KbtqaMkXJpE0sJn9disNA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:uGIQMG2kYqo=:QKfZDqvoThN4La0qUNMx9/
	3JVdEIpX8z54r/mnNbh3OOFQHWvGOoZ0JwBlDQb/b0+zm9ocWF6uhraagNlzESysDdOC8mkb7
	fMiiTQ1lOFjvO4eFvHetgqyR/eWoJ3E++ft1cJ7U+Qnzr6FElUvWVHjWvQLAPFqPo6xSAjMpz
	NmOVORwMRQn0T9dsHjbf+G3XebBBhBIoGiLXROsOwKgnV+VjIOHQ68l3BiSq9EBZlEH6Zmrhb
	ymQaKIqFR1qtwvpkm/zDGXRYm/yBc0T9EG0qA3Lf2gUuoVrczUmxGPQVu38EcQvUoXIeVuSB/
	nzJKM1LMeDBr2OmFkAD3dcPffl7xR0ZQjWEnge9XsQ5a9uV8/7Xf+TPlICjwUMjbfdalEHgfC
	+np8WJn8u2rC44cmCVgPMmu8ACG8z1eJJgEt8uTaoFWNPxqwSqinPg/PJv+3o3Ki4Hp4yyCOE
	KEgfI1lOVew/O6DmeT2h3TjKuyblhtiE2y4mzLtRjcYwo5eZTfZYB7dgAI1SWlUYryFYKOwBk
	Cf1DCrzY99FgnaAGQXJ1a27yc8qodxla63L2BHTJpdQG5MEnUGGhTcnw5/oInlQwAng+Vlhn5
	u0dl2eaV7YLvYlRT5OlnJz8gCvHdQ5YSUWcsEKWGoz9TGp9t65PCZCbkVmnEjwn6zdrjnTOTo
	J0+V8yl/twsErgpQiHzTsDLLMxK5jbMJeBLbpfhWk5dLN5HhMrI98NYr6AMC2NTN/RMCJvbGH
	mq0tdPBEkkcxAjeSATlbDRw2CQZZAPKYVWAMwBO8FmuHSafDXO+bDaHYBdw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user: fix
 is_proc_myself to check the paths via realpath
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Nov 2017 23:44:41 -0000

Le 25/10/2017 à 05:34, Zach Riggle a écrit :
> Previously, it was possible to get a handle to the "real" /proc/self/mem
> by creating a symlink to it and opening the symlink, or opening e.g.
> "./mem" after chdir'ing to "/proc/self".
> 
>     $ ln -s /proc/self self
>     $ cat self/maps
>     60000000-602bc000 r-xp 00000000 fc:01 270375                             /usr/bin/qemu-arm-static
>     604bc000-6050f000 rw-p 002bc000 fc:01 270375                             /usr/bin/qemu-arm-static
>     ...
> 
> Signed-off-by: Zach Riggle <zachriggle@gmail.com>
> ---
>  linux-user/syscall.c | 47 ++++++++++++++++++++++++++++-------------------
>  1 file changed, 28 insertions(+), 19 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9bf901fa11..6c1f28a1f7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7496,26 +7496,35 @@ static int open_self_auxv(void *cpu_env, int fd)
> 
>  static int is_proc_myself(const char *filename, const char *entry)
>  {
> -    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
> -        filename += strlen("/proc/");
> -        if (!strncmp(filename, "self/", strlen("self/"))) {
> -            filename += strlen("self/");
> -        } else if (*filename >= '1' && *filename <= '9') {
> -            char myself[80];
> -            snprintf(myself, sizeof(myself), "%d/", getpid());
> -            if (!strncmp(filename, myself, strlen(myself))) {
> -                filename += strlen(myself);
> -            } else {
> -                return 0;
> -            }
> -        } else {
> -            return 0;
> -        }
> -        if (!strcmp(filename, entry)) {
> -            return 1;
> -        }
> +    char proc_self_entry[PATH_MAX + 1];
> +    char proc_self_entry_realpath[PATH_MAX + 1];
> +    char filename_realpath[PATH_MAX + 1];
> +
> +    if (PATH_MAX < snprintf(proc_self_entry,
> +                            sizeof(proc_self_entry),
> +                            "/proc/self/%s",
> +                            entry)) {
> +        /* Full path to "entry" is too long to fit in the buffer */
> +        return 0;
>      }
> -    return 0;
> +
> +    if (!realpath(filename, filename_realpath)) {
> +        /* File does not exist, or can't be canonicalized */
> +        return 0;
> +    }
> +
> +    if (!realpath(proc_self_entry, proc_self_entry_realpath)) {
> +        /* Procfs entry does not exist */
> +        return 0;
> +    }
> +
> +    if (strcmp(filename_realpath, proc_self_entry_realpath) != 0) {
> +        /* Paths are different */

I think it doesn't work with /proc/map/exe (or other soft link in
/proc/self) as realpath will give the path of the executable and not the
path inside /proc so it will be true for any process with the same
executable (which in our case is qemu for all).

Thanks,
Laurent


