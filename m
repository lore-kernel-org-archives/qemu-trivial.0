Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WdqlX-0004VY-Od
	for mharc-qemu-trivial@gnu.org; Fri, 25 Apr 2014 20:46:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WdqlQ-0004He-0u
	for qemu-trivial@nongnu.org; Fri, 25 Apr 2014 20:46:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WdqlJ-0003Mg-VZ
	for qemu-trivial@nongnu.org; Fri, 25 Apr 2014 20:46:43 -0400
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233]:46343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1Wdql7-0003IA-NV; Fri, 25 Apr 2014 20:46:25 -0400
Received: by mail-wi0-f179.google.com with SMTP id z2so3421448wiv.0
	for <multiple recipients>; Fri, 25 Apr 2014 17:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=P//3lIisrBBmffhVkTbaEDixTdjRDC9ZLusPEPj7vso=;
	b=hgRn8VIb8dHLQXPbu793BHSVDrfqVpMso+UNEfPoAQWhTve53QFvp6+/hVR2h0UFWF
	nuIK0gyHcALWMb4p+sUPaFwPHJKqvmxFnYtvYuy6TEvWjui7r13BnT5IDAUp/kweYFGi
	ZOzh5cLI3Pb5BrK+7XsQSFHUaBsMQvh6ZAjJpCVn3TYMKH5ISpCdfB+Ex/UKtb3mZXhf
	uwMAcZ8zVnAqV02Hp2QcK4E56cDhysENcEVrdspLXAyoGbnHIhlztz4ctZPwFK2uETAT
	IT7FdyBrsQ83I63vkAIOmkNHtghjEFB8K7+ZVzlxOozshgq9qCtDjE0JooveQX9EaoVA
	adxA==
X-Received: by 10.180.100.129 with SMTP id ey1mr5817754wib.60.1398473184357;
	Fri, 25 Apr 2014 17:46:24 -0700 (PDT)
Received: from Inspiron-3521 ([41.104.48.227])
	by mx.google.com with ESMTPSA id gz1sm678447wib.14.2014.04.25.17.46.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Apr 2014 17:46:23 -0700 (PDT)
Date: Sat, 26 Apr 2014 01:46:16 +0100
From: Hani Benhabiles <kroosec@gmail.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20140426004616.GA3514@Inspiron-3521>
References: <1398203043-20559-1-git-send-email-kroosec@gmail.com>
	<20140425114033.50333f11@redhat.com> <535A8485.7020809@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <535A8485.7020809@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::233
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	imammedo@redhat.com, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] qmp: Remove unused variable.
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
X-List-Received-Date: Sat, 26 Apr 2014 00:46:50 -0000

On Fri, Apr 25, 2014 at 05:51:33PM +0200, Andreas Färber wrote:
> Am 25.04.2014 17:40, schrieb Luiz Capitulino:
> > On Tue, 22 Apr 2014 22:44:03 +0100
> > Hani Benhabiles <kroosec@gmail.com> wrote:
> > 
> >> Signed-off-by: Hani Benhabiles <hani@linux.com>
> >> ---
> >>  qmp.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/qmp.c b/qmp.c
> >> index 87a28f7..44a6e17 100644
> >> --- a/qmp.c
> >> +++ b/qmp.c
> >> @@ -194,11 +194,10 @@ void qmp_system_wakeup(Error **errp)
> >>  ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
> >>  {
> >>      Object *obj;
> >> -    bool ambiguous = false;
> >>      ObjectPropertyInfoList *props = NULL;
> >>      ObjectProperty *prop;
> >>  
> >> -    obj = object_resolve_path(path, &ambiguous);
> >> +    obj = object_resolve_path(path, NULL);
> >>      if (obj == NULL) {
> >>          error_set(errp, QERR_DEVICE_NOT_FOUND, path);
> >>          return NULL;
> > 
> > I'm under the impression that this check in object_resolve_partial_path():
> > 
> >         if (ambiguous && *ambiguous) {
> >             return NULL;
> >         }
> > 
> > Uses 'ambiguous' internally. In that case, this change could have a side effect.
> > 
> > But I'm not sure, I think it would be good to get a reviewed-by from
> > a QOM expert.
> 
> Your understanding matches mine. I would propose to instead use the
> variable in error reporting:
> 

Luiz, Andreas, thanks for spotting this.

On second thought, I agree that this has the side effect of listing the last
found object with that path value, though the preivous behaviour too is
suboptimal as it reports that no devices are found at that path.

> if (ambiguous) {
>     error_setg(errp, "Path '%s' is ambiguous.", path);
> } else {
>     error_set(errp, QERR_DEVICE_NOT_FOUND, path);
> }
> 

Probably, you meant something like this:

if (ambiguous) {
    error_set(errp, QERR_AMBIGUOUS_PATH, path);
} else if (!obj) {
    error_set(errp, QERR_DEVICE_NOT_FOUND, path);
}


> My reasoning is that an ambiguous path might deliver unpredictable
> results (whichever it encounters first), across QEMU versions at least.
> 
> But I'd like to hear Paolo's opinion, too, since he was involved in
> loosening requirements on paths.
> 

Is this documented somewhere ? Searching the mailing-list archives doesn't show
something concrete. Paolo ?

Quick grepping shows only one out of 9 other object_resolve_path() calls
checking for path ambiguity.


