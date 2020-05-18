Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jafe5-00082h-3C
	for mharc-qemu-trivial@gnu.org; Mon, 18 May 2020 09:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jafe3-000814-Ut
 for qemu-trivial@nongnu.org; Mon, 18 May 2020 09:17:27 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30858
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jafe2-0005ov-BN
 for qemu-trivial@nongnu.org; Mon, 18 May 2020 09:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589807845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hO5s4pwgSKIz4wc7eUJFUZw07FYxYL3A4Zvi1+EiJ8I=;
 b=hDlzNGJeUPsBv0j196s3475GFJ8RvOGfURpG9GZUWm0alYDGQeK86g+TCXqFDJ17egHjwS
 OsJzWpH/GfXOtxgA+ig5EX3WUDNehAJK7AeUqa1LOW7HoX4E7DfHMJcnf2l8tn+WvEwin1
 XEVPzSTOahkY/JEFD1a91mEOVbKmJ4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-HRl-J9wqPuicx608h3qMiw-1; Mon, 18 May 2020 09:17:23 -0400
X-MC-Unique: HRl-J9wqPuicx608h3qMiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F518872FE0;
 Mon, 18 May 2020 13:17:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37AA22E161;
 Mon, 18 May 2020 13:17:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BC6FF11358BC; Mon, 18 May 2020 15:17:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Paul Durrant <paul@xen.org>,  Jason Wang
 <jasowang@redhat.com>,  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org,  Gerd Hoffmann <kraxel@redhat.com>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Stefano Stabellini
 <sstabellini@kernel.org>,  qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,  David Hildenbrand <david@redhat.com>,  Halil
 Pasic <pasic@linux.ibm.com>,  Christian Borntraeger
 <borntraeger@de.ibm.com>,  Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,  Joel Stanley <joel@jms.id.au>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,  Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Eduardo
 Habkost
 <ehabkost@redhat.com>,  Corey Minyard <minyard@acm.org>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,  Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>,  John Snow <jsnow@redhat.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,  Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,  qemu-ppc@nongnu.org,  Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
References: <20200512070020.22782-1-f4bug@amsat.org>
 <871rnlsps6.fsf@dusky.pond.sub.org>
 <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com>
Date: Mon, 18 May 2020 15:17:10 +0200
In-Reply-To: <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com> (Paolo
 Bonzini's message of "Mon, 18 May 2020 14:40:19 +0200")
Message-ID: <87imgt9ycp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:52:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 18 May 2020 13:17:28 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 15/05/20 07:58, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>=20
>>> Remove unnecessary casts using coccinelle scripts.
>>>
>>> The CPU()/OBJECT() patches don't introduce logical change,
>>> The DEVICE() one removes various OBJECT_CHECK() calls.
>> Queued, thanks!
>>=20
>> Managing expecations: I'm not a QOM maintainer, I don't want to become
>> one, and I don't normally queue QOM patches :)
>>=20
>
> I want to be again a QOM maintainer, but it's not the best time for me
> to be one.  So thanks for picking up my slack.

You're welcome :)


