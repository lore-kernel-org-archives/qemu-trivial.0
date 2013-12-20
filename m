Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vu4oa-0004Ac-Tn
	for mharc-qemu-trivial@gnu.org; Fri, 20 Dec 2013 13:28:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.a@redhat.com>) id 1Vu4oR-0003ub-I8
	for qemu-trivial@nongnu.org; Fri, 20 Dec 2013 13:28:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.a@redhat.com>) id 1Vu4oL-0001UK-7w
	for qemu-trivial@nongnu.org; Fri, 20 Dec 2013 13:28:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:27605)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.a@redhat.com>)
	id 1Vu4o7-0001Mz-S3; Fri, 20 Dec 2013 13:28:20 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBKISHdi023637
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 20 Dec 2013 13:28:18 -0500
Received: from [10.35.200.138] (vpn-200-138.tlv.redhat.com [10.35.200.138])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBKISEPa029106; Fri, 20 Dec 2013 13:28:15 -0500
Message-ID: <1387564050.28388.9.camel@localhost.localdomain>
From: Marcel Apfelbaum <marcel.a@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <52B401A0.2010403@msgid.tls.msk.ru>
References: <1387523131-15647-1-git-send-email-famz@redhat.com>
	<52B401A0.2010403@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 Dec 2013 20:27:30 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] acpi unit-test: Create temporary disk
	file under /tmp
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
X-List-Received-Date: Fri, 20 Dec 2013 18:28:46 -0000

On Fri, 2013-12-20 at 12:36 +0400, Michael Tokarev wrote:
> 20.12.2013 11:05, Fam Zheng wrote:
> > As other tests, the image file is created in /tmp other than current
> > dir. Thus there will not be an unignored file under tests for intree
> > build.
> > 
> > Signed-off-by: Fam Zheng <famz@redhat.com>
> > ---
> >  tests/acpi-test.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/acpi-test.c b/tests/acpi-test.c
> > index ca83b1d6..e4f31b7 100644
> > --- a/tests/acpi-test.c
> > +++ b/tests/acpi-test.c
> > @@ -116,7 +116,7 @@ static uint8_t boot_sector[0x200] = {
> >      [0x1FF] = 0xAA,
> >  };
> >  
> > -static const char *disk = "tests/acpi-test-disk.raw";
> > +static const char *disk = "/tmp/qtest-acpi-test-disk.raw";
> 
> Please, PLEASE do NOT do this.
> 
> If you want a temp dir, create one in qemu source directory
> (there's no urge to be able to specify one at build/run time,
> a symlink created by user will do), -- so that all this junk
> will be in a single dir easy to remove.
> 
> But never, ever, use /tmp like this, not here not elsewhere
> else.  When you use /tmp, first, there's $TEMPDIR, and second,
> much more important, there are apis like mkstemp(3) or
> tmpfile(3), or tempnam(3), -- THIS is the only proper way to
> use common temporary directories.
> 
> Never, ever, create fixed (or even predictable, with getpid()
> for example) files in public temporary dirs.  Never.
> 
> For this issue, I think a better solution is to actually remove
> this file on make clean.  Now you're just moving an unignored
> file elsewhere, which isn't good by its own.

I would use (and let glib do the work): 
    fd = g_file_open_tmp("prefix-XXXXXX", file_name, &error);
    g_assert_no_error(error);
    ...
and of course in the end:
    unlink(file_name);

I hope I helped,
Marcel


> 
> Thanks,
> 
> /mjt




