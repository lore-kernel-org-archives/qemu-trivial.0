Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZjEs-00020a-Qv
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 15:41:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZjEr-00020U-0P
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZjEm-0007Ep-4n
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:41:57 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:53441)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dZjEl-0007EX-Q0; Mon, 24 Jul 2017 15:41:52 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue103 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0MhO2U-1dD88g0Yuw-00Ma2I; Mon, 24 Jul 2017 21:41:36 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-30-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <eff38438-8224-680b-86a8-b3ed0053a855@vivier.eu>
Date: Mon, 24 Jul 2017 21:41:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-30-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:NZhtBwX/c4KiSsxKaNOUzgI0eisWduNFSYCuKDaXHqS2a1NqD9B
	imFkucJEQgVgRdQy/901XYOUgy1bbgGe9A/kYxHNlWdoOGvi36D3sSvWY2vLkWGdJlHtC3l
	xK1oGFlg9SgRzOxVST30LEnZPu/yKVu0vhGONqX/qTTBD6SGLyCQHSq25Rm5ncNiIz4gLn1
	FgmmYJR/A2vbRHWPMwmzw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ntw97lEPNJQ=:yGaGsvzNDT7qOrNRiTlRWA
	nUWQiVZ24EVJtJbt6j4TXOq8fdofh/5OUqB6RZpH2UEzCoxgreiEDG1BzMa0QGruzSWcNHnIt
	Ux81nufXFUvcOpSrB6iKABQmEfBfgp+Qp4fj35B+XwWNyTC4lRfbSCLkdxkd1aQEx94Z2QGsJ
	2UnIHuk/SeU+z+PSx35oqfmOKon9jPf6DnAC6AmGexfyYLIPk+QayBqU/1hFBXHJTaIP8FZFy
	6Z5KF/2LhF610XnSUSVzPHlbIeHfTSp41kEpRJ/Mpygn3eVTPjgewbsfcKPOb/yUKL9ZcfxbS
	f/0shRIn5BQ17Pb/ksn3hNAf5Ibjp4uaI/k34CwkuzLE7IJLgzlWLx1vqCCIUE30uajDlQsbf
	oJCs3N2ZCtwTSy6NPlskTG/Gwo2Dw7XCNIvYGhE+7lSiqBsXqTEGFxXtgAmrl1I7qNz1GQlqY
	FV7LAjYr16f5lQqKguLpPbdVT4BLv/HUjQWLzOCU1vg7Gv76bTM4p8CW4pu8y736mrnchgdlc
	zGul1IxKxpTPSDIL85l1m5hqffFp66mQeJg/XBd4m5AMjnWd7KrnAY2MG1r7k+g0xe8Zow3ko
	kSQRn0ACb2+ey7UwZ/vmI24tJV/F2+SM3oDfJBfbroIoeBVU0WQpJW07d8A+xbBHHh69v+h83
	frQ9AxXt7OBqdgzQ3x5Qsg1oHv7sJllwbMiZWL1BfvJ4o+62IO88xZY1NFEATwnsqIYOG70JA
	nqhd5u1ot0zH59F1vNdleGRAzLHRIzslsgXSZiBO+GzkY2ogolx9NnAlrqo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [PATCH for 2.10 29/35] syscall: fix out-of-bound
 memory access
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
X-List-Received-Date: Mon, 24 Jul 2017 19:41:58 -0000

Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
> linux-user/syscall.c:555:25: warning: Out of bound memory access (accessed memory precedes memory block)
>     target_fd_trans[fd] = trans;
>     ~~~~~~~~~~~~~~~~~~~~^~~~~~~
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 637270a02d..26450d235f 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -544,6 +544,7 @@ static void fd_trans_register(int fd, TargetFdTrans *trans)
>  {
>      unsigned int oldmax;
>  
> +    assert(fd >= 0);
>      if (fd >= target_fd_max) {
>          oldmax = target_fd_max;
>          target_fd_max = ((fd >> 6) + 1) << 6; /* by slice of 64 entries */
> 

I think we should fix inotify_init(), inotify_init1(), eventfd() and
eventfd2() that call fd_trans_register() without checking the value of
fd before adding this assert...

Thanks,
Laurent

