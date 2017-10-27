Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e813u-0004sq-9s
	for mharc-qemu-trivial@gnu.org; Fri, 27 Oct 2017 05:36:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <voipio@kos.to>) id 1e813m-0004q4-Na
	for qemu-trivial@nongnu.org; Fri, 27 Oct 2017 05:36:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <voipio@kos.to>) id 1e813l-0004cI-Qx
	for qemu-trivial@nongnu.org; Fri, 27 Oct 2017 05:36:14 -0400
Received: from jessie.kos.to ([212.47.231.226]:43612 helo=pilvi.kos.to)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <voipio@kos.to>)
	id 1e813d-0004J6-CI; Fri, 27 Oct 2017 05:36:05 -0400
Received: from kos.to (jessie.kos.to [212.47.231.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pilvi.kos.to (Postfix) with ESMTPSA id 4DD9B2C19B9;
	Fri, 27 Oct 2017 09:36:01 +0000 (UTC)
Received: (nullmailer pid 29605 invoked by uid 1000);
	Fri, 27 Oct 2017 09:36:00 -0000
Date: Fri, 27 Oct 2017 09:36:00 +0000
From: Riku Voipio <riku.voipio@iki.fi>
To: Zach Riggle <zachriggle@gmail.com>
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Message-ID: <20171027093600.GA29513@kos.to>
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
	<CAMP9c5=whCgR4qkOPDRKZ+adpWEPiVM=BwZp_r7qCAR7UAsWAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMP9c5=whCgR4qkOPDRKZ+adpWEPiVM=BwZp_r7qCAR7UAsWAQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.47.231.226
Subject: Re: [Qemu-trivial] [PATCH v2] linux-user: fix is_proc_myself to
 check the paths via realpath
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
X-List-Received-Date: Fri, 27 Oct 2017 09:36:21 -0000

On Thu, Oct 26, 2017 at 04:06:22PM -0500, Zach Riggle wrote:
> Friendly ping :)
> 
> I've updated the patch with v2 which addresses the style issue

I'll have a look at it soon.
 
> 
> *Zach Riggle*
> 
> On Tue, Oct 24, 2017 at 10:34 PM, Zach Riggle <zachriggle@gmail.com> wrote:
> 
> > Previously, it was possible to get a handle to the "real" /proc/self/mem
> > by creating a symlink to it and opening the symlink, or opening e.g.
> > "./mem" after chdir'ing to "/proc/self"

When is this a problem? Symlinking to /proc/self seems to be a quite weird usecase.

> >
> >     $ ln -s /proc/self self
> >     $ cat self/maps
> >     60000000-602bc000 r-xp 00000000 fc:01 270375
> >    /usr/bin/qemu-arm-static
> >     604bc000-6050f000 rw-p 002bc000 fc:01 270375
> >    /usr/bin/qemu-arm-static
> >     ...
> >
> > Signed-off-by: Zach Riggle <zachriggle@gmail.com>
> > ---
> >  linux-user/syscall.c | 47 ++++++++++++++++++++++++++++-------------------
> >  1 file changed, 28 insertions(+), 19 deletions(-)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index 9bf901fa11..6c1f28a1f7 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -7496,26 +7496,35 @@ static int open_self_auxv(void *cpu_env, int fd)
> >
> >  static int is_proc_myself(const char *filename, const char *entry)
> >  {
> > -    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
> > -        filename += strlen("/proc/");
> > -        if (!strncmp(filename, "self/", strlen("self/"))) {
> > -            filename += strlen("self/");
> > -        } else if (*filename >= '1' && *filename <= '9') {
> > -            char myself[80];
> > -            snprintf(myself, sizeof(myself), "%d/", getpid());
> > -            if (!strncmp(filename, myself, strlen(myself))) {
> > -                filename += strlen(myself);
> > -            } else {
> > -                return 0;
> > -            }
> > -        } else {
> > -            return 0;
> > -        }
> > -        if (!strcmp(filename, entry)) {
> > -            return 1;
> > -        }
> > +    char proc_self_entry[PATH_MAX + 1];
> > +    char proc_self_entry_realpath[PATH_MAX + 1];
> > +    char filename_realpath[PATH_MAX + 1];
> > +
> > +    if (PATH_MAX < snprintf(proc_self_entry,
> > +                            sizeof(proc_self_entry),
> > +                            "/proc/self/%s",
> > +                            entry)) {
> > +        /* Full path to "entry" is too long to fit in the buffer */
> > +        return 0;
> >      }
> > -    return 0;
> > +
> > +    if (!realpath(filename, filename_realpath)) {
> > +        /* File does not exist, or can't be canonicalized */
> > +        return 0;
> > +    }
> > +
> > +    if (!realpath(proc_self_entry, proc_self_entry_realpath)) {
> > +        /* Procfs entry does not exist */
> > +        return 0;
> > +    }
> > +
> > +    if (strcmp(filename_realpath, proc_self_entry_realpath) != 0) {
> > +        /* Paths are different */
> > +        return 0;
> > +    }
> > +
> > +    /* filename refers to /proc/self/<entry> */
> > +    return 1;
> >  }
> >
> >  #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
> > --
> > 2.14.3
> >
> >

