Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9SHa-0003Ds-OY
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:15:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SHY-0003BE-3n
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:15:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SHW-0005qo-4t
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:15:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47178)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9SHO-0005jV-Jt; Sun, 05 Jun 2016 03:15:26 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 113F2408D7;
	Sun,  5 Jun 2016 10:15:08 +0300 (MSK)
To: Fabien Siron <fabien.siron@epita.fr>, qemu-trivial@nongnu.org
References: <1464790984-8123-1-git-send-email-fabien.siron@epita.fr>
Cc: qemu-devel <qemu-devel@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5753D17B.5070800@msgid.tls.msk.ru>
Date: Sun, 5 Jun 2016 10:15:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1464790984-8123-1-git-send-email-fabien.siron@epita.fr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] pc: Use fstat in get_file_size()
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
X-List-Received-Date: Sun, 05 Jun 2016 07:15:37 -0000

Please direct all patches to qemu-devel@ too, don't use ONLY
qemu-trivial.  Thanks.

01.06.2016 17:23, Fabien Siron wrote:
> As mentioned in the comment, fstat is quite simpler than playing with
> ftell() and fseek().
> 
> Signed-off-by: Fabien Siron <fabien.siron@epita.fr>
> ---
>  hw/i386/pc.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 99437e0..fecb067 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -801,16 +801,13 @@ static FWCfgState *bochs_bios_init(AddressSpace *as, PCMachineState *pcms)
>  
>  static long get_file_size(FILE *f)
>  {
> -    long where, size;
> +    struct stat stat;
> +    int fd;
>  
> -    /* XXX: on Unix systems, using fstat() probably makes more sense */
> +    fd = fileno(f);
> +    fstat(fd, &stat);

There's no need to introduce fd variable here, it is perfectly
sane to use fstat(fileno(f), &stat) here.

> -    where = ftell(f);
> -    fseek(f, 0, SEEK_END);
> -    size = ftell(f);
> -    fseek(f, where, SEEK_SET);
> -
> -    return size;
> +    return stat.st_size;

Note there's no error checking in this function, neither in the
original nor in the new implementation.  But old function, in case
of error, will most likely return -1 (error result of ftell()),
while new function will return some random value.

So the body should look something like:

  struct stat st;
  return fstat(fileno(f), &st) < 0 ? -1 : st.st_size;

Thanks,

/mjt


