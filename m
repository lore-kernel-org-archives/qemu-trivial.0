Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tv39P-0000qt-En
	for mharc-qemu-trivial@gnu.org; Tue, 15 Jan 2013 04:49:47 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tv39M-0000iD-Bp
	for qemu-trivial@nongnu.org; Tue, 15 Jan 2013 04:49:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tv39H-00077d-I4
	for qemu-trivial@nongnu.org; Tue, 15 Jan 2013 04:49:44 -0500
Received: from mail-wi0-f177.google.com ([209.85.212.177]:37259)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tv39F-00076v-Bu; Tue, 15 Jan 2013 04:49:37 -0500
Received: by mail-wi0-f177.google.com with SMTP id hm2so2094152wib.10
	for <multiple recipients>; Tue, 15 Jan 2013 01:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=zD/tVlxSF4t49XpfChlhp09T+4qHrKJj+SIkHBzm/IE=;
	b=kQJPw3LxhJcd9cyC0sFZyJPvFSfHJmBqe0t1GDuDOXdQnMkmawToGSzAXqf4KjXlg2
	oH2Uw5CybPCc0owkpJyh7vnuEIYiRxh9JQPlcZcp+cVJJT426pzMxJms1/oOPZ8euO/q
	STQlMfTYx/VEr8tReBwwkXy61PJrKruaDaUbzXcuc9F4+pIVXgAD3LKFn+6LRkbJTb22
	22Zjvgt70BLE45QrzzGhSS3ux2IGXxHE4HZiMXJx0A08E7deHLdQo3nv8M5V5PCMBcuy
	0WHOfDw7d6r/nH3avHTSoKwQpfqd8HPrOMqytABhu3UwkXJ+votynpjNu5h+HznLqarM
	nakw==
X-Received: by 10.194.90.116 with SMTP id bv20mr34898140wjb.33.1358243376403; 
	Tue, 15 Jan 2013 01:49:36 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id bz12sm2960757wib.5.2013.01.15.01.49.34
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 01:49:34 -0800 (PST)
Date: Tue, 15 Jan 2013 10:49:33 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Vadim Evard <v.e.evard@gmail.com>
Message-ID: <20130115094933.GA2654@stefanha-thinkpad.redhat.com>
References: <50E1BDC3.5040604@gmail.com>
 <50F00ACC.8020606@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50F00ACC.8020606@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.177
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: try pkg-config
 for curses
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
X-List-Received-Date: Tue, 15 Jan 2013 09:49:45 -0000

On Fri, Jan 11, 2013 at 04:51:24PM +0400, Vadim Evard wrote:
> ping
> 
> Пнд 31 Дек 2012 20:30:59, Vadim Evard писал:
> >configure: try pkg-config for curses
> >
> >Static linkikng against ncurses may require explicit -ltinfo.
> >In case -lcurses and -lncurses both didn't work give pkg-config a
> >chance.
> >
> >Signed-off-by: Vadim Evard <v.e.evard@gmail.com>
> >---
> >configure | 4 +++-
> >1 file changed, 3 insertions(+), 1 deletion(-)
> >
> >diff --git a/configure b/configure
> >index b0c7e54..16280e2 100755
> >--- a/configure
> >+++ b/configure
> >@@ -2030,7 +2030,7 @@ fi
> >if test "$mingw32" = "yes" ; then
> >curses_list="-lpdcurses"
> >else
> >- curses_list="-lncurses -lcurses"
> >+ curses_list="-lncurses:-lcurses:$($pkg_config --libs ncurses)"
> >fi
> >
> >if test "$curses" != "no" ; then
> >@@ -2043,7 +2043,9 @@ int main(void) {
> >return s != 0;
> >}
> >EOF
> >+ IFS=:
> >for curses_lib in $curses_list; do
> >+ unset IFS
> >if compile_prog "" "$curses_lib" ; then
> >curses_found=yes
> >libs_softmmu="$curses_lib $libs_softmmu"

Please also unset IFS after the loop so there will never be a problem if
curses_list="".

Stefan

