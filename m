Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwDbg-0003o1-Vp
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 10:39:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1SwDbU-0003mK-RC
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1SwDbM-0004cf-E1
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:39:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23222)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1SwDbM-0004cH-6D; Tue, 31 Jul 2012 10:39:12 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6VEccZa009492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 31 Jul 2012 10:38:39 -0400
Received: from redhat.com (dhcp-1-196.lcy.redhat.com [10.32.224.196])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6VEcZx3029553
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Tue, 31 Jul 2012 10:38:37 -0400
Date: Tue, 31 Jul 2012 15:38:34 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20120731143834.GJ2475@redhat.com>
References: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
	<87pq7c9fng.fsf@blackfin.pond.sub.org>
	<CAFEAcA_M7RJdCjsxycJUJcOLGe+DdBPSKuagb_=Kspwp-29A2Q@mail.gmail.com>
	<87k3xk577l.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87k3xk577l.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, patches@linaro.org,
	qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Avoid explicit
 list of directories in clean target
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 14:39:31 -0000

On Tue, Jul 31, 2012 at 04:35:42PM +0200, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On 31 July 2012 15:19, Markus Armbruster <armbru@redhat.com> wrote:
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >>> +     find . -name '*.[od]' | xargs rm -f
> >>> + rm -f *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod
> >>> *~ */*~
> >>
> >> Shit happens if you somehow manage to create a "mean" file name in the
> >> build tree.  Sure you don't want to -print0 | xargs -0?
> >
> > -print0 isn't POSIX, so I wasn't sure it would be present on all
> > our platforms. (It's probably fairly safe, though...)
> 
> Another option is "-exec rm {} +".

Isn't using 'find' somewhat overkill here really. QEMU only creates
.o and .d files in 2 levels of directory, so sure we can just avoid
find entirely

  rm -f *.[od] */*.[od]

Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

