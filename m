Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YK17h-0003io-5S
	for mharc-qemu-trivial@gnu.org; Sat, 07 Feb 2015 03:52:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YK17f-0003gT-TF
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 03:52:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YK17f-0003HQ-2T
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 03:52:15 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YK17a-0002y5-Np; Sat, 07 Feb 2015 03:52:10 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CDD3641366;
	Sat,  7 Feb 2015 11:52:02 +0300 (MSK)
Message-ID: <54D5D232.3070308@msgid.tls.msk.ru>
Date: Sat, 07 Feb 2015 11:52:02 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
	<1422270747-23994-6-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1422270747-23994-6-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 5/7] cutils: refine strtol error handling
 in parse_debug_env
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
X-List-Received-Date: Sat, 07 Feb 2015 08:52:16 -0000

26.01.2015 14:12, Paolo Bonzini wrote:
> Avoid truncation of a 64-bit long to a 32-bit int, and check for errno
> (especially ERANGE).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/cutils.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index dbe7412..f227064 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -523,7 +523,7 @@ int parse_debug_env(const char *name, int max, int initial)
>  {
>      char *debug_env = getenv(name);
>      char *inv = NULL;
> -    int debug;
> +    long debug;
>  
>      if (!debug_env) {
>          return initial;
> @@ -532,7 +532,7 @@ int parse_debug_env(const char *name, int max, int initial)
>      if (inv == debug_env) {
>          return initial;
>      }
> -    if (debug < 0 || debug > max) {
> +    if (debug < 0 || debug > max || errno != 0) {

It is not really right to check errno without (re)setting it
before call to strtol().

Thanks,

/mjt

