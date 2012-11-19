Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TaMpq-0003VP-DT
	for mharc-qemu-trivial@gnu.org; Mon, 19 Nov 2012 03:36:06 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TaMpl-0003G4-7V
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 03:36:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TaMpi-0001GT-3H
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 03:36:01 -0500
Received: from mail-bk0-f45.google.com ([209.85.214.45]:37289)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TaMph-0001GL-SQ; Mon, 19 Nov 2012 03:35:58 -0500
Received: by mail-bk0-f45.google.com with SMTP id jk13so782372bkc.4
	for <multiple recipients>; Mon, 19 Nov 2012 00:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=A40Oiud7MtKwCp16FX7T8Nb2D8Xc11uCvCCu1W6B4/A=;
	b=u1alCxDl+8XEzHO7ihd1PrgPaywimUYA3UnQpx4YPwDLyD3WZHjZ8ddzHpjxgc79L+
	9s1kLAxeiIeHXyTsgzkqgWdcQzqdgoPFOXbV5qqCPdHtV+hUwWbU/Tb6ZQirdUeMYjOe
	lMN7vtPS33LtFZUGwRiYGaLoySObW5ogFbc96BBAhe3CQACVLh+z+AuC2Yd+9oWqZMJy
	tdb6C/Gjjm/N4QATBOU3zS48JZHBQd2GUQZ4FSvM1gMH7XoJI854fadkyraNSofju+d0
	sUyrawPD32b8O5lXcSOFWRpWDyWoC74l17q4n+L/J0NyRwLOX0TpSTc1GnPkqpg4aSje
	a/ag==
Received: by 10.204.129.211 with SMTP id p19mr4544943bks.94.1353314156755;
	Mon, 19 Nov 2012 00:35:56 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id v8sm303546bku.6.2012.11.19.00.35.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2012 00:35:56 -0800 (PST)
Date: Mon, 19 Nov 2012 09:35:54 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121119083554.GA17444@stefanha-thinkpad.redhat.com>
References: <1351840452-481-1-git-send-email-sw@weilnetz.de>
	<50A9387C.3040808@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50A9387C.3040808@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix spelling (prefered -> preferred)
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
X-List-Received-Date: Mon, 19 Nov 2012 08:36:04 -0000

On Sun, Nov 18, 2012 at 08:35:24PM +0100, Stefan Weil wrote:
> Am 02.11.2012 08:14, schrieb Stefan Weil:
> >Signed-off-by: Stefan Weil<sw@weilnetz.de>
> >---
> >  configure       |    2 +-
> >  net/tap-win32.c |    7 ++++---
> >  2 files changed, 5 insertions(+), 4 deletions(-)
> >
> >diff --git a/configure b/configure
> >index 79701ea..860859b 100755
> >--- a/configure
> >+++ b/configure
> >@@ -2115,7 +2115,7 @@ if test "$pixman" = "system"; then
> >  else
> >    if test ! -d ${source_path}/pixman/pixman; then
> >      echo "ERROR: pixman not present. Your options:"
> >-    echo "  (1) Prefered: Install the pixman devel package (any recent"
> >+    echo "  (1) Preferred: Install the pixman devel package (any recent"
> >      echo "      distro should have packages as Xorg needs pixman too)."
> >      echo "  (2) Fetch the pixman submodule, using:"
> >      echo "      git submodule update --init pixman"
> >diff --git a/net/tap-win32.c b/net/tap-win32.c
> >index 8d2d32b..f9bd741 100644
> >--- a/net/tap-win32.c
> >+++ b/net/tap-win32.c
> >@@ -565,7 +565,7 @@ static void tap_win32_free_buffer(tap_win32_overlapped_t *overlapped,
> >  }
> >
> >  static int tap_win32_open(tap_win32_overlapped_t **phandle,
> >-                          const char *prefered_name)
> >+                          const char *preferred_name)
> >  {
> >      char device_path[256];
> >      char device_guid[0x100];
> >@@ -581,8 +581,9 @@ static int tap_win32_open(tap_win32_overlapped_t **phandle,
> >      DWORD version_len;
> >      DWORD idThread;
> >
> >-    if (prefered_name != NULL)
> >-        snprintf(name_buffer, sizeof(name_buffer), "%s", prefered_name);
> >+    if (preferred_name != NULL) {
> >+        snprintf(name_buffer, sizeof(name_buffer), "%s", preferred_name);
> >+    }
> >
> >      rc = get_device_guid(device_guid, sizeof(device_guid), name_buffer, sizeof(name_buffer));
> >      if (rc)
> 
> ping?

Thanks, applied to the trivial patches tree.  Sorry I missed this one.

There is currently a pending trivial patches pull request - this patch
will be in the next pull request.

Stefan

