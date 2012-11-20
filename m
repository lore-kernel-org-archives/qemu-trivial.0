Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tanm0-00051y-33
	for mharc-qemu-trivial@gnu.org; Tue, 20 Nov 2012 08:21:56 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tanlv-00050F-NX
	for qemu-trivial@nongnu.org; Tue, 20 Nov 2012 08:21:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tanlq-0005Z1-7V
	for qemu-trivial@nongnu.org; Tue, 20 Nov 2012 08:21:51 -0500
Received: from mail-bk0-f45.google.com ([209.85.214.45]:38773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tanlp-0005Y0-TY; Tue, 20 Nov 2012 08:21:46 -0500
Received: by mail-bk0-f45.google.com with SMTP id jk13so1389585bkc.4
	for <multiple recipients>; Tue, 20 Nov 2012 05:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=izMmGjKll9k7izfG4Teqbeybhh28+RRsckzTJeS/2a0=;
	b=q+bbRedgRJsSzoBcqhtPsaih/zrtu7L6XjQ/PNY0+E+T/6Rg4E6zcts0H1C4NgLRJH
	mDIdN7GRqjbaqj/03eTRulMJ/ju7AoDHTX44Di3W1CEONb2fUExcpW3J54vTQxIvAWvD
	+SSlTPP4LnO+3/UZIk755HA6Xe3xOwmjVsbIQSI8x7J0DRpHaqGmatp2x9gOat/fPGeJ
	f5Mrd5xQBx0XAIkIyjf1FcIR1C2p/+ioYdkcmG8jcUsBUwiiBKlZJvbz6rtOgk5xGWCC
	9r2UDxPZEDix0W8FxMFwrG7Ioq6N2H9bFph4ssHF4l6a9jK8IYEwpUYBRolLi93Cc02x
	4i+w==
Received: by 10.204.146.13 with SMTP id f13mr6081076bkv.29.1353417704890;
	Tue, 20 Nov 2012 05:21:44 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id k3sm6880176bku.13.2012.11.20.05.21.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Nov 2012 05:21:43 -0800 (PST)
Date: Tue, 20 Nov 2012 14:21:42 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121120132142.GE27378@stefanha-thinkpad.redhat.com>
References: <1353227175-24596-1-git-send-email-sw@weilnetz.de>
	<20121119113111.GA21658@stefanha-thinkpad.redhat.com>
	<50AA6E88.5050303@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50AA6E88.5050303@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Jim Meyering <meyering@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] block: Fix regression for MinGW
 (assertion caused by short string)
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
X-List-Received-Date: Tue, 20 Nov 2012 13:21:54 -0000

On Mon, Nov 19, 2012 at 06:38:16PM +0100, Stefan Weil wrote:
> Am 19.11.2012 12:31, schrieb Stefan Hajnoczi:
> >On Sun, Nov 18, 2012 at 09:26:15AM +0100, Stefan Weil wrote:
> >>The local string tmp_filename is passed to function get_tmp_filename
> >>which expects a string with minimum size MAX_PATH for w32 hosts.
> >>
> >>MAX_PATH is 260 and PATH_MAX is 259, so tmp_filename was too short.
> >>
> >>Commit eba25057b9a5e19d10ace2bc7716667a31297169 introduced this
> >>regression.
> >>
> >>Signed-off-by: Stefan Weil <sw@weilnetz.de>
> >>---
> >>  block.c |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/block.c b/block.c
> >>index 49dd6bb..8739635 100644
> >>--- a/block.c
> >>+++ b/block.c
> >>@@ -787,7 +787,7 @@ int bdrv_open(BlockDriverState *bs, const char *filename, int flags,
> >>                BlockDriver *drv)
> >>  {
> >>      int ret;
> >>-    char tmp_filename[PATH_MAX];
> >>+    char tmp_filename[PATH_MAX + 1];
> >This is not maintainable - the patch is making an assumption about the relative
> >values of MAX_PATH and PATH_MAX.  There is no comment explaining this so it's
> >likely to be changed and break in the future again.
> 
> The relation between MAX_PATH and PATH_MAX seems to be well definedand
> is valid for w32 and w64, so there is no need to make any assumption:
> 
> buffers must allocate MAX_PATH elements for up to PATH_MAX
> character entries plus a terminating 0.
> 
> I considered writing a comment, but decided not to do so because
> caller and called function are in the same file and most people
> are not very interested in Windows peculiarities.
> 
> The code in block/vvfat.c which uses a length of 1024without
> explanation is worse.

Since there are only two callers it's not a big effort to rewrite the
function so it allocates the string.  That way the platform-specific
length requirement doesn't leak to the caller.

Interesting related patch from Eric Blake a few years ago ;-):
http://permalink.gmane.org/gmane.comp.gnu.mingw.devel/4089

> >The existing get_tmp_filename() code has another problem.  Here is the Windows
> >get_tmp_filename() code:
> >
> >     char temp_dir[MAX_PATH];
> >     /* GetTempFileName requires that its output buffer (4th param)
> >        have length MAX_PATH or greater.  */
> >     assert(size >= MAX_PATH);
> >     return (GetTempPath(MAX_PATH, temp_dir)
> >             && GetTempFileName(temp_dir, "qem", 0, filename)
> >             ? 0 : -GetLastError());
> >
> >The assert has an off-by-one error because the documentation says:
> >
> >   "This buffer should be MAX_PATH characters to accommodate the path plus the
> >    terminating null character."
> >   http://msdn.microsoft.com/en-us/library/windows/desktop/aa364991(v=vs.85).aspx
> 
> No. The documentation can be read in two ways:
> 
>   "This buffer should be (MAX_PATH characters) to accommodate (the path plus the
>    terminating null character)."
> 
> 
>   "This buffer should be (MAX_PATH characters to accommodate the path) plus (the
>    terminating null character)."
> 
> 
> The first one matches the current code and also the example from MS:
> http://msdn.microsoft.com/en-us/library/windows/desktop/aa363875%28v=vs.85%29.aspx

After reading more on MSDN it looks like interpretation #1 is correct.
I thought the NUL character needs to be added on afterwards.

> >Since the function returns -errno the assert could be turned into:
> >
> >   /* GetTempFileName requires that its output buffer (4th param)
> >      have length MAX_PATH + 1 or greater.  */
> >   if (size < MAX_PATH + 1) {
> >       return -ENOSPC;
> >   }
> >
> >Stefan
> 
> "if (size < MAX_PATH) {"
> 
> I'd still prefer the assertion because that is not a general purpose
> library function but a QEMU internal function which must be called
> with correct parameters. Here raising an assertion is better than
> silently returning an error status. Of course we could do both.
> 
> Any patch which fixes this regression for MinGW is fine -
> my patch was simply the smallest possible change to achieve this goal,
> and I still think that it is sufficient.
> 
> If we want a better solution, we should also consider g_mkstemp
> and related functions like g_file_open_tmp. We could also modify
> bdrv_create to allow a NULL filename which is interpreted as a
> temporary filename. IMHO that would be a good solution for the
> future (= after 1.3). Feel free to add a TODO comment to the
> code in my patch.

/* TODO extra byte is a hack to ensure MAX_PATH space on Windows */

Stefan

