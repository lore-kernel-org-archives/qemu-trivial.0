Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um1XZ-00072R-QC
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 08:49:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1Um1XV-00071X-Dk
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 08:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1Um1S3-0000SM-Uu
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 08:44:08 -0400
Received: from mail-bk0-x233.google.com ([2a00:1450:4008:c01::233]:60495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>)
	id 1Um1Rr-0000Nd-N8; Mon, 10 Jun 2013 08:43:47 -0400
Received: by mail-bk0-f51.google.com with SMTP id ji1so2525251bkc.24
	for <multiple recipients>; Mon, 10 Jun 2013 05:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=uwDMVwQKAHIVum5ygxEUZbh6fvVRsbR9X+vKeSicN+s=;
	b=lUrKMBFtnjW81L0nSKpW6I9UysBlbXdf1+u5rCxkeFpW9M30WVwc/kwy7nM8U0FaJa
	AjmQ4g6823FRg1seyOGWUB0I3MMwQx/0oFtQG/1123NWLlUOlnP2SbjkIQTY1h333wGL
	RmFHhs6wwdLH+aql3A++irjdZKdk470C4XvAlkJSNoDZE4hbR3AQdMIq5Rqb8Lb0hHy4
	15s7CmC84CfJo5Ek1f6GFcyv92liE3z8yVOKABJe4FjfYUiPFMPKh+bf1ZodmVL1d8OL
	GK+dOvEQO10+zBKpgyHxkveNnR7fHEKPIkJNEXZ2ukP3tZDgfvujI0o9fjBXFSKUaCTg
	uyIg==
X-Received: by 10.204.189.80 with SMTP id dd16mr1442830bkb.126.1370868226733; 
	Mon, 10 Jun 2013 05:43:46 -0700 (PDT)
Received: from al.localnet (al.lekensteyn.nl. [2001:470:1f15:b83::c0d1:f1ed])
	by mx.google.com with ESMTPSA id
	fz10sm3724355bkc.9.2013.06.10.05.43.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 05:43:45 -0700 (PDT)
From: Peter Wu <lekensteyn@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Date: Mon, 10 Jun 2013 14:43:42 +0200
Message-ID: <2282258.ks7pGhyqjl@al>
User-Agent: KMail/4.10.4 (Linux/3.9.1-1-custom; KDE/4.10.4; x86_64; ; )
In-Reply-To: <20130610123328.GF3636@dhcp-200-207.str.redhat.com>
References: <11837115.9GZ72nQAUt@al>
	<20130610123328.GF3636@dhcp-200-207.str.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::233
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gtk: implement -full-screen
	and -no-frame
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
X-List-Received-Date: Mon, 10 Jun 2013 12:49:40 -0000

On Monday 10 June 2013 14:33:28 Kevin Wolf wrote:
> Am 09.06.2013 um 12:30 hat Peter Wu geschrieben:
> > Aiming for GTK as replacement for SDL, features like -full-screen and
> > -no-frame should also be implemented.
> >
> > 
> >
> > Bringing the window into full-screen mode is done by faking activating the
> > full screen menu item with a NULL menu item (which currently is not used
> > by gd_menu_full_screen). This is done after showing the windows to make
> > the cursor and menu hidden.
> >
> > 
> >
> > Signed-off-by: Peter Wu <lekensteyn@gmail.com>
> > ---
> >
> >  include/ui/console.h |  2 +-
> >  ui/gtk.c             | 10 +++++++++-
> >  vl.c                 |  2 +-
> >  3 files changed, 11 insertions(+), 3 deletions(-)
> > 
> >
> > diff --git a/include/ui/console.h b/include/ui/console.h
> > index 4307b5f..7174ba9 100644
> > --- a/include/ui/console.h
> > +++ b/include/ui/console.h
> > @@ -339,6 +339,6 @@ int index_from_keycode(int code);
> >
> >  
> >  /* gtk.c */
> >  void early_gtk_display_init(void);
> >
> > -void gtk_display_init(DisplayState *ds);
> > +void gtk_display_init(DisplayState *ds, int full_screen, int no_frame);
> 
> Should the new arguments be bool?

Probably yes, but for consistency with the existing types I kept it as int. A 
future patch could change all uses of "int" to "bool" where 1 or 0 are used, 
do you prefer to use bool here anyway?

Regards,
Peter

