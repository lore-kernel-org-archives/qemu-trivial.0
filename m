Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WIDbs-00015Z-Dl
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2014 03:43:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WIDbk-0000wz-LG
	for qemu-trivial@nongnu.org; Tue, 25 Feb 2014 03:43:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WIDbe-0001lM-Oy
	for qemu-trivial@nongnu.org; Tue, 25 Feb 2014 03:43:20 -0500
Received: from mail-ee0-x22d.google.com ([2a00:1450:4013:c00::22d]:64398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WIDbP-0001dC-A5; Tue, 25 Feb 2014 03:42:59 -0500
Received: by mail-ee0-f45.google.com with SMTP id d17so191936eek.18
	for <multiple recipients>; Tue, 25 Feb 2014 00:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eEglOU+tXlxuAZYZ9FSrhEgHzhPTkzrq1YoSnFLY3yY=;
	b=VsfR2QBRUBv41t07Abu3H/JdHusiKNzvg0P/V/GWSJeGOIXt6lFJysfH/yUB4GsofO
	MpQQmqLif1stHL6nrDBImwAN+qtouW4UwTtaY5FFfibZoMGqdDF8lEvZBCyFkIpc3y9T
	mpZaMm7vdUzZL4USQXqDZJzRJK8ivPrmQjud8n+3wuHlezYL21gYtFI39Yf7vFrXS+cN
	TQ+5f9cPAG+463H3HKfPQ2Fb6Ss2rX/T3PHariWCZVIKjlpNIGKul6mS8XOD1ujbe0Ps
	niQjRwXreJcbOBVfY3W+MS0GtAukVMsMU3vPbKi9qiGj7ftaokGa+uk74hEgDkVpZt65
	7AgQ==
X-Received: by 10.15.56.8 with SMTP id x8mr29175477eew.83.1393317778217;
	Tue, 25 Feb 2014 00:42:58 -0800 (PST)
Received: from Inspiron-3521 ([41.103.124.71])
	by mx.google.com with ESMTPSA id x6sm74057713eew.20.2014.02.25.00.42.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 25 Feb 2014 00:42:57 -0800 (PST)
Date: Tue, 25 Feb 2014 09:42:43 +0100
From: Hani Benhabiles <kroosec@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20140225084243.GA3806@Inspiron-3521>
References: <1393312205-7858-1-git-send-email-kroosec@gmail.com>
	<87txbnshy9.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87txbnshy9.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22d
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, peter.crosthwaite@xilinx.com,
	qemu-devel@nongnu.org, lcapitulino@redhat.com
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
X-List-Received-Date: Tue, 25 Feb 2014 08:43:26 -0000

On Tue, Feb 25, 2014 at 09:41:02AM +0100, Markus Armbruster wrote:
> Hani Benhabiles <kroosec@gmail.com> writes:
> 
> > The error message as currently used is confusing as there are no "balloon" or
> > "spice" devices.
> >
> > (qemu) balloon 1024
> > balloon: Device 'balloon' has not been activated
> >
> > With this patch:
> >
> > (qemu) balloon 1024
> > balloon: No balloon device has been activated
> >
> > Signed-off-by: Hani Benhabiles <hani@linux.com>
> > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  include/qapi/qmp/qerror.h | 2 +-
> >  qmp.c                     | 2 --
> >  2 files changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> > index 73c67b7..25193c9 100644
> > --- a/include/qapi/qmp/qerror.h
> > +++ b/include/qapi/qmp/qerror.h
> > @@ -105,7 +105,7 @@ void qerror_report_err(Error *err);
> >      ERROR_CLASS_GENERIC_ERROR, "Device '%s' does not support hotplugging"
> >  
> >  #define QERR_DEVICE_NOT_ACTIVE \
> > -    ERROR_CLASS_DEVICE_NOT_ACTIVE, "Device '%s' has not been activated"
> > +    ERROR_CLASS_DEVICE_NOT_ACTIVE, "No %s device has been activated"
> >  
> >  #define QERR_DEVICE_NOT_ENCRYPTED \
> >      ERROR_CLASS_GENERIC_ERROR, "Device '%s' is not encrypted"
> > diff --git a/qmp.c b/qmp.c
> > index d0d98e7..ffddd26 100644
> > --- a/qmp.c
> > +++ b/qmp.c
> > @@ -289,7 +289,6 @@ void qmp_set_password(const char *protocol, const char *password,
> >  
> >      if (strcmp(protocol, "spice") == 0) {
> >          if (!using_spice) {
> > -            /* correct one? spice isn't a device ,,, */
> >              error_set(errp, QERR_DEVICE_NOT_ACTIVE, "spice");
> >              return;
> >          }
> > @@ -337,7 +336,6 @@ void qmp_expire_password(const char *protocol, const char *whenstr,
> >  
> >      if (strcmp(protocol, "spice") == 0) {
> >          if (!using_spice) {
> > -            /* correct one? spice isn't a device ,,, */
> >              error_set(errp, QERR_DEVICE_NOT_ACTIVE, "spice");
> >              return;
> >          }
> 
> The wording of the error message is still suboptimal for the
> !using_spice case, but it's an improvement.  I'd leave the two comments
> alone, though.  Hani, if you agree, then Luiz could perhaps merge your
> patch with these two hunks dropped.
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Sure, no problem with dropping them. Thanks for the review, Markus!



