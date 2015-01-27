Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG9sS-0005h9-7h
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 12:24:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YG9sP-0005dt-Pl
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 12:24:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YG9sO-0001c0-W1
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 12:24:33 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:47027)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YG9sK-0001bF-Mp; Tue, 27 Jan 2015 12:24:28 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9D53442FB8;
	Tue, 27 Jan 2015 20:24:27 +0300 (MSK)
Message-ID: <54C7C9CB.5010905@msgid.tls.msk.ru>
Date: Tue, 27 Jan 2015 20:24:27 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Chen Gang S <gang.chen@sunrus.com.cn>, 
	Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>
References: <54C4322A.3060704@sunrus.com.cn>
In-Reply-To: <54C4322A.3060704@sunrus.com.cn>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] linux-user/syscall.c: Need call
 unlock_user() before go to failure return in default case
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
X-List-Received-Date: Tue, 27 Jan 2015 17:24:35 -0000

25.01.2015 03:00, Chen Gang S wrote:
> In abi_long do_ioctl_dm(), after calls lock_user(), it does not call
> unlock_user() before go to failure return in default case.

Applied to -trivial, with the following description (modified just slightly,
I tried to keep original wording as much as possible):

    linux-user/syscall.c: do_ioctl_dm: Need to call unlock_user() before going to failure return in default case

    In abi_long do_ioctl_dm(), after lock_user() call, the code does
    not call unlock_user() before going to failure return in default case.

Thank you!

/mjt

> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  linux-user/syscall.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a427f7a..ec9e4fc 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3566,6 +3566,7 @@ static abi_long do_ioctl_dm(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
>      }
>      default:
>          ret = -TARGET_EINVAL;
> +        unlock_user(argptr, guest_data, 0);
>          goto out;
>      }
>      unlock_user(argptr, guest_data, 0);
> @@ -3685,6 +3686,7 @@ static abi_long do_ioctl_dm(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
>              break;
>          }
>          default:
> +            unlock_user(argptr, guest_data, 0);
>              ret = -TARGET_EINVAL;
>              goto out;
>          }
> 


