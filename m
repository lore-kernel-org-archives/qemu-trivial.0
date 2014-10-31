Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDwq-0003DQ-FX
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:17:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkDvk-0005tc-Ne
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xk4Ko-000507-Uc
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 01:01:21 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:38921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xk4Ko-0004za-90; Fri, 31 Oct 2014 01:01:14 -0400
Received: from 172.24.2.119 (EHLO szxeml424-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDS16757; Fri, 31 Oct 2014 13:01:04 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml424-hub.china.huawei.com
	(10.82.67.163) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 31 Oct 2014 13:00:59 +0800
Message-ID: <5453178B.2040504@huawei.com>
Date: Fri, 31 Oct 2014 13:00:59 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
	<dc4522b965468522221bd08231b169b1a3e28c69.1414681502.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <dc4522b965468522221bd08231b169b1a3e28c69.1414681502.git.mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 3/4] pidfile: stop making pidfile error a
	special case
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Oct 2014 15:17:06 -0000

On 2014/10/30 23:07, Michael Tokarev wrote:

> In case of -daemonize, we write non-zero to the daemon
> pipe only if pidfile creation failed, so the parent will
> report error about pidfile problem.  There's no need to
> make special case for this, since all other errors are
> reported by the child just fine.  Let the parent report
> error and simplify logic in os_daemonize().
> 
> This way, we don't need os_pidfile_error() function, since
> it only prints error now, so put the error reporting printf
> into the only place where qemu_create_pidfile() is called,
> in vl.c.
> 
> While at it, fix wrong identation in os_daemonize().

s/identation/identification/

> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  include/qemu-common.h |    1 -
>  os-posix.c            |   29 ++++++-----------------------
>  os-win32.c            |    5 -----
>  vl.c                  |    2 +-
>  4 files changed, 7 insertions(+), 30 deletions(-)
> 
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index b87e9c2..f862214 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -357,7 +357,6 @@ char *qemu_find_file(int type, const char *name);
>  void os_setup_early_signal_handling(void);
>  char *os_find_datadir(void);
>  void os_parse_cmd_args(int index, const char *optarg);
> -void os_pidfile_error(void);
>  
>  /* Convert a byte between binary and BCD.  */
>  static inline uint8_t to_bcd(uint8_t val)
> diff --git a/os-posix.c b/os-posix.c
> index eada8d4..a3b96d9 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -221,18 +221,12 @@ void os_daemonize(void)
>              do {
>                  len = read(fds[0], &status, 1);
>              } while (len < 0 && errno == EINTR);
> -            if (len != 1) {
> -                exit(1);
> -            }

Does this check need to be removed?

> -            else if (status == 1) {
> -                fprintf(stderr, "Could not acquire pidfile\n");
> -                exit(1);
> -            } else {
> -                exit(0);
> -            }
> -            } else if (pid < 0) {
> -                exit(1);
> -            }
> +
> +            exit(len == 1 && status == 0 ? 0 : 1);
> +
> +        } else if (pid < 0) {
> +            exit(1);
> +        }
>  
>          close(fds[0]);
>          daemon_pipe = fds[1];
> @@ -290,17 +284,6 @@ void os_setup_post(void)
>      }
>  }
>  
> -void os_pidfile_error(void)
> -{
> -    if (daemonize) {
> -        uint8_t status = 1;
> -        if (write(daemon_pipe, &status, 1) != 1) {
> -            perror("daemonize. Writing to pipe\n");
> -        }
> -    } else
> -        fprintf(stderr, "Could not acquire pid file: %s\n", strerror(errno));
> -}
> -
>  void os_set_line_buffering(void)
>  {
>      setvbuf(stdout, NULL, _IOLBF, 0);
> diff --git a/os-win32.c b/os-win32.c
> index 5f95caa..c0daf8e 100644
> --- a/os-win32.c
> +++ b/os-win32.c
> @@ -104,11 +104,6 @@ void os_parse_cmd_args(int index, const char *optarg)
>      return;
>  }
>  
> -void os_pidfile_error(void)
> -{
> -    fprintf(stderr, "Could not acquire pid file: %s\n", strerror(errno));
> -}
> -
>  int qemu_create_pidfile(const char *filename)
>  {
>      char buffer[128];
> diff --git a/vl.c b/vl.c
> index f6b3546..150524c 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3999,7 +3999,7 @@ int main(int argc, char **argv, char **envp)
>  #endif
>  
>      if (pid_file && qemu_create_pidfile(pid_file) != 0) {
> -        os_pidfile_error();
> +        fprintf(stderr, "Could not acquire pid file: %s\n", strerror(errno));
>          exit(1);
>      }
>  




