Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZTMh-0000Ei-Ga
	for mharc-qemu-trivial@gnu.org; Fri, 15 May 2020 01:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jZTMf-0000BU-Kt
 for qemu-trivial@nongnu.org; Fri, 15 May 2020 01:58:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39711
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jZTMf-0002yV-0e
 for qemu-trivial@nongnu.org; Fri, 15 May 2020 01:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589522312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pWfAQ0tUqEVcxnRaG3DXAf86VAbLFMa86O/kZ9GP1v0=;
 b=IaAlzbR9DUN4a0fDNNHb0TFtWsNNssS71Rw7QfcbaA40fqhzMKkXU3AGrd7WbovpPtTkhI
 ifq4WTuAm2TrdM4A++kBQedDkb+pYO0DYdP7ai+rvNg4ePp0kv7KgNPvShb+tdyCTwg7/7
 cmQd41J9Jfonv2iNTn/o92bNNrJdaWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-PR4YSkK4P7mzfPK4-G2OSA-1; Fri, 15 May 2020 01:58:28 -0400
X-MC-Unique: PR4YSkK4P7mzfPK4-G2OSA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32191107ACF3;
 Fri, 15 May 2020 05:58:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96F0A5D9D7;
 Fri, 15 May 2020 05:58:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 44AA411358BC; Fri, 15 May 2020 07:58:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,  Paul
 Durrant <paul@xen.org>,  Jason Wang <jasowang@redhat.com>,  Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Gerd Hoffmann
 <kraxel@redhat.com>,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,  qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,  David Hildenbrand <david@redhat.com>,  Halil
 Pasic <pasic@linux.ibm.com>,  Christian Borntraeger
 <borntraeger@de.ibm.com>,  Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,  Joel Stanley <joel@jms.id.au>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,  David Gibson
 <david@gibson.dropbear.id.au>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,  Eduardo Habkost <ehabkost@redhat.com>,  Corey
 Minyard <minyard@acm.org>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  qemu-s390x@nongnu.org,  qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,
 John Snow <jsnow@redhat.com>,  Richard Henderson <rth@twiddle.net>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Andrew Jeffery
 <andrew@aj.id.au>,  Cornelia Huck <cohuck@redhat.com>,  Laurent Vivier
 <laurent@vivier.eu>,  qemu-ppc@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
References: <20200512070020.22782-1-f4bug@amsat.org>
Date: Fri, 15 May 2020 07:58:17 +0200
In-Reply-To: <20200512070020.22782-1-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 May 2020 09:00:17
 +0200")
Message-ID: <871rnlsps6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 23:27:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Fri, 15 May 2020 05:58:33 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Remove unnecessary casts using coccinelle scripts.
>
> The CPU()/OBJECT() patches don't introduce logical change,
> The DEVICE() one removes various OBJECT_CHECK() calls.

Queued, thanks!

Managing expecations: I'm not a QOM maintainer, I don't want to become
one, and I don't normally queue QOM patches :)


