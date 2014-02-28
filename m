Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WJSTD-0005Kl-KN
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2014 13:47:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1WJST6-0005BI-OL
	for qemu-trivial@nongnu.org; Fri, 28 Feb 2014 13:47:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1WJST1-0001GK-OP
	for qemu-trivial@nongnu.org; Fri, 28 Feb 2014 13:47:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39579)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1WJSSp-0001Ef-FU; Fri, 28 Feb 2014 13:47:15 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1SIlDG3001317
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 28 Feb 2014 13:47:13 -0500
Received: from localhost (ovpn-113-119.phx2.redhat.com [10.3.113.119])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1SIlB7n002631; Fri, 28 Feb 2014 13:47:12 -0500
Date: Fri, 28 Feb 2014 13:40:15 -0500
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Hani Benhabiles <kroosec@gmail.com>
Message-ID: <20140228134015.048e6d48@redhat.com>
In-Reply-To: <20140225084243.GA3806@Inspiron-3521>
References: <1393312205-7858-1-git-send-email-kroosec@gmail.com>
	<87txbnshy9.fsf@blackfin.pond.sub.org>
	<20140225084243.GA3806@Inspiron-3521>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, peter.crosthwaite@xilinx.com,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qerror: Improve
 QERR_DEVICE_NOT_ACTIVE message
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
X-List-Received-Date: Fri, 28 Feb 2014 18:47:37 -0000

On Tue, 25 Feb 2014 09:42:43 +0100
Hani Benhabiles <kroosec@gmail.com> wrote:

> On Tue, Feb 25, 2014 at 09:41:02AM +0100, Markus Armbruster wrote:
> > Hani Benhabiles <kroosec@gmail.com> writes:
> > 
> > > The error message as currently used is confusing as there are no "balloon" or
> > > "spice" devices.
> > >
> > > (qemu) balloon 1024
> > > balloon: Device 'balloon' has not been activated
> > >
> > > With this patch:
> > >
> > > (qemu) balloon 1024
> > > balloon: No balloon device has been activated
> > >
> > > Signed-off-by: Hani Benhabiles <hani@linux.com>
> > > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > > ---
> > >  include/qapi/qmp/qerror.h | 2 +-
> > >  qmp.c                     | 2 --
> > >  2 files changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> > > index 73c67b7..25193c9 100644
> > > --- a/include/qapi/qmp/qerror.h
> > > +++ b/include/qapi/qmp/qerror.h
> > > @@ -105,7 +105,7 @@ void qerror_report_err(Error *err);
> > >      ERROR_CLASS_GENERIC_ERROR, "Device '%s' does not support hotplugging"
> > >  
> > >  #define QERR_DEVICE_NOT_ACTIVE \
> > > -    ERROR_CLASS_DEVICE_NOT_ACTIVE, "Device '%s' has not been activated"
> > > +    ERROR_CLASS_DEVICE_NOT_ACTIVE, "No %s device has been activated"
> > >  
> > >  #define QERR_DEVICE_NOT_ENCRYPTED \
> > >      ERROR_CLASS_GENERIC_ERROR, "Device '%s' is not encrypted"
> > > diff --git a/qmp.c b/qmp.c
> > > index d0d98e7..ffddd26 100644
> > > --- a/qmp.c
> > > +++ b/qmp.c
> > > @@ -289,7 +289,6 @@ void qmp_set_password(const char *protocol, const char *password,
> > >  
> > >      if (strcmp(protocol, "spice") == 0) {
> > >          if (!using_spice) {
> > > -            /* correct one? spice isn't a device ,,, */
> > >              error_set(errp, QERR_DEVICE_NOT_ACTIVE, "spice");
> > >              return;
> > >          }
> > > @@ -337,7 +336,6 @@ void qmp_expire_password(const char *protocol, const char *whenstr,
> > >  
> > >      if (strcmp(protocol, "spice") == 0) {
> > >          if (!using_spice) {
> > > -            /* correct one? spice isn't a device ,,, */
> > >              error_set(errp, QERR_DEVICE_NOT_ACTIVE, "spice");
> > >              return;
> > >          }
> > 
> > The wording of the error message is still suboptimal for the
> > !using_spice case, but it's an improvement.  I'd leave the two comments
> > alone, though.  Hani, if you agree, then Luiz could perhaps merge your
> > patch with these two hunks dropped.
> > 
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> Sure, no problem with dropping them. Thanks for the review, Markus!

Done.

