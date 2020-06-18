Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlqWf-0007db-Oa
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2020 05:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jlqWe-0007dS-NK
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 05:08:00 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35265
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jlqWc-0007XM-Qj
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 05:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592471278;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PjcsTXgEpCzfHvcxlXI32mgAbc/s2cRpOZloAsQV0w=;
 b=YDDS0VZxFhbKRD4TJPOjfZ9rnxwFBznxV139EI4A2xj4cmM1IHZDOmnx7lQku+xO/Z1jt/
 ShstOcElIla0AC3pXg0AOBR+M9UAsMzLM5Y5MTdOI8Rf+DR1LptSnK6frBeejSJtBjWdwD
 PJIxtEnJvEQmEUoYPu06ZHvCoGkdvzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-VYe5Otp3N2ezOXRGdvRBag-1; Thu, 18 Jun 2020 05:07:50 -0400
X-MC-Unique: VYe5Otp3N2ezOXRGdvRBag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF3D7100CCC2;
 Thu, 18 Jun 2020 09:07:48 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51CED60CD0;
 Thu, 18 Jun 2020 09:07:44 +0000 (UTC)
Date: Thu, 18 Jun 2020 10:07:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] scripts/tracetool: Add plainlog backend
Message-ID: <20200618090741.GC671599@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200617134505.9D06E7482D3@zero.eik.bme.hu>
 <20200618073124.GA1956319@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200618073124.GA1956319@stefanha-x1.localdomain>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:32:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jun 2020 09:08:00 -0000

On Thu, Jun 18, 2020 at 08:31:24AM +0100, Stefan Hajnoczi wrote:
> On Wed, Jun 17, 2020 at 03:36:29PM +0200, BALATON Zoltan wrote:
> > Add a backend that is the same as the log backend but omits the
> > process id and timestamp so logs are easier to read and diff-able.
> > 
> > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> > ---
> >  scripts/tracetool/backend/plainlog.py | 48 +++++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >  create mode 100644 scripts/tracetool/backend/plainlog.py
> > 
> > diff --git a/scripts/tracetool/backend/plainlog.py b/scripts/tracetool/backend/plainlog.py
> > new file mode 100644
> > index 0000000000..40bbfa6d76
> > --- /dev/null
> > +++ b/scripts/tracetool/backend/plainlog.py
> > @@ -0,0 +1,48 @@
> > +# -*- coding: utf-8 -*-
> > +
> > +"""
> > +Stderr built-in backend, plain log without proc ID and time.
> > +"""
> > +
> > +__author__     = "Llu????s Vilanova <vilanova@ac.upc.edu>"
> > +__copyright__  = "Copyright 2012-2017, Llu????s Vilanova <vilanova@ac.upc.edu>"
> 
> There is a Unicode issue here, Lluís' name is not printed correctly.
> 
> > +__license__    = "GPL version 2 or (at your option) any later version"
> > +
> > +__maintainer__ = "Stefan Hajnoczi"
> > +__email__      = "stefanha@linux.vnet.ibm.com"
> > +
> > +
> > +from tracetool import out
> > +
> > +
> > +PUBLIC = True
> > +
> > +
> > +def generate_h_begin(events, group):
> > +    out('#include "qemu/log-for-trace.h"',
> > +        '')
> > +
> > +
> > +def generate_h(event, group):
> > +    argnames = ", ".join(event.args.names())
> > +    if len(event.args) > 0:
> > +        argnames = ", " + argnames
> > +
> > +    if "vcpu" in event.properties:
> > +        # already checked on the generic format code
> > +        cond = "true"
> > +    else:
> > +        cond = "trace_event_get_state(%s)" % ("TRACE_" + event.name.upper())
> > +
> > +    out('    if (%(cond)s && qemu_loglevel_mask(LOG_TRACE)) {',
> > +        '        qemu_log("%(name)s " %(fmt)s "\\n" %(argnames)s);',
> > +        '    }',
> > +        cond=cond,
> > +        name=event.name,
> > +        fmt=event.fmt.rstrip("\n"),
> > +        argnames=argnames)
> 
> It is not necessary to introduce a new backend. There could be an option
> that controls whether or not the timestamp/tid is printed. For example,
> -trace timestamp=off or maybe the timestmap/tid can be integrated into
> qemu_log() itself so that it's used more consistently and a -d timestamp
> option enables it.

QEMU already has a "-msg timestamp=on|off" option that controls whether
error reports on stderr get a timestamp. I think it is probably reasonable
for this existing option to apply to anything QEMU prints to stdout/err,
and thus we could wire it up for qemu_log().

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


