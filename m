Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jatxm-0004lF-1O
	for mharc-qemu-trivial@gnu.org; Tue, 19 May 2020 00:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jatxk-0004es-96
 for qemu-trivial@nongnu.org; Tue, 19 May 2020 00:34:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35201
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jatxj-0002je-Bo
 for qemu-trivial@nongnu.org; Tue, 19 May 2020 00:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589862882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfnN/w0SbYD3vSZtzIfW4lXKbb9M26zh5YzR9hzaFVI=;
 b=L8MLLXhQkMrLbyq8ielh0e5Ls515T2WhfpAccUrMMN3yBZG14Ol8b7SBEL2K8XkXZlJOjL
 JKMANNIRkfxsdxSjlUNZ/KgRP/OPV9g1rf0gybJmCnel8KYaFqAni/tfn+2RvaqYoKSBbR
 FeHiF56IjFLyS+3l5yuns55Pumoi9mA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-m6FuIhfxMOmghIZJQdusCw-1; Tue, 19 May 2020 00:34:31 -0400
X-MC-Unique: m6FuIhfxMOmghIZJQdusCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B63A6A0BD7;
 Tue, 19 May 2020 04:34:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0F5E19C4F;
 Tue, 19 May 2020 04:34:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2FD6311358BC; Tue, 19 May 2020 06:34:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Paul Durrant <paul@xen.org>,  Jason Wang
 <jasowang@redhat.com>,  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org,  Laurent Vivier <laurent@vivier.eu>,  Gerd
 Hoffmann <kraxel@redhat.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org,  qemu-trivial@nongnu.org,  David Hildenbrand
 <david@redhat.com>,  Halil Pasic <pasic@linux.ibm.com>,  Christian
 Borntraeger <borntraeger@de.ibm.com>,  Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,  Joel Stanley <joel@jms.id.au>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,  David Gibson
 <david@gibson.dropbear.id.au>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,  Eduardo Habkost <ehabkost@redhat.com>,  Corey
 Minyard <minyard@acm.org>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  qemu-s390x@nongnu.org,  qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,  John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Andrew Jeffery <andrew@aj.id.au>,  Cornelia Huck
 <cohuck@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 qemu-ppc@nongnu.org,  Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
References: <20200512070020.22782-1-f4bug@amsat.org>
 <871rnlsps6.fsf@dusky.pond.sub.org>
 <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com>
 <87imgt9ycp.fsf@dusky.pond.sub.org>
 <2f4607cf-90a9-ca9a-4ef6-a8358631cdf0@kaod.org>
Date: Tue, 19 May 2020 06:34:19 +0200
In-Reply-To: <2f4607cf-90a9-ca9a-4ef6-a8358631cdf0@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Mon, 18 May 2020 15:21:52 +0200")
Message-ID: <87k1187dbo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 00:34:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 19 May 2020 04:34:44 -0000

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 5/18/20 3:17 PM, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>=20
>>> On 15/05/20 07:58, Markus Armbruster wrote:
>>>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>>>
>>>>> Remove unnecessary casts using coccinelle scripts.
>>>>>
>>>>> The CPU()/OBJECT() patches don't introduce logical change,
>>>>> The DEVICE() one removes various OBJECT_CHECK() calls.
>>>> Queued, thanks!
>>>>
>>>> Managing expecations: I'm not a QOM maintainer, I don't want to become
>>>> one, and I don't normally queue QOM patches :)
>>>>
>>>
>>> I want to be again a QOM maintainer, but it's not the best time for me
>>> to be one.  So thanks for picking up my slack.
>>=20
>> You're welcome :)
>
> Could you help me getting this patch merged ? :)
>
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20200404153340.16486=
1-1-clg@kaod.org/

I have more QOM patches in the pipe, and I may well post another QOM
pull request while Paolo is busy with other stuff.  I'll consider
including other QOM patches then.  Non-trivial ones need an R-by from
Paolo, Daniel or Eduardo.


