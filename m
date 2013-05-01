Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXYdm-00086F-Ux
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2013 11:08:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UXYdk-00085g-AQ
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 11:08:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UXYdh-0006GR-Vm
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 11:08:15 -0400
Received: from mail-gg0-x22e.google.com ([2607:f8b0:4002:c02::22e]:47326)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UXYdh-0006GJ-Qc; Wed, 01 May 2013 11:08:13 -0400
Received: by mail-gg0-f174.google.com with SMTP id k2so286239ggd.19
	for <multiple recipients>; Wed, 01 May 2013 08:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=nQBANuQ5K45T6aMZ3ywA3cIxk/CKDzNvXlW09BhABpk=;
	b=AHWubMbK3vQznbqyBwGBqXduzeMDq41t2vL1u2XgJZVsIIIHuJ0dMOqrHaCPGH+jnu
	58soV1Yk77HxNGPJ0O7DapPaQYGYaPBXfJaR47h/vZOj8uiKZR9bsVZ75q5MOUFqxZka
	eicBY6BGdX4i2H3Gu666GVr0n7QozjWef82+a+DBcxZHiBkIFFY70q0Ky7KY7VcBZ8lA
	e4K97TSsJBRvSnNXcOUqKiSSM14SnobtmXGztsFU/sMee53n6egPSxUqLCVrgEXUZdK5
	nOPj8SxCOu+bS1f5zz+vkjndPUZaGabg3g8VdGCdaUowk587YuAirWfe3FvbzBR1r1BZ
	x1Lg==
X-Received: by 10.236.82.70 with SMTP id n46mr2128354yhe.97.1367420893431;
	Wed, 01 May 2013 08:08:13 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-176-20.ip50.fastwebnet.it.
	[93.34.176.20])
	by mx.google.com with ESMTPSA id j47sm5780531yhm.21.2013.05.01.08.08.11
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 01 May 2013 08:08:12 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <51812FCD.7050507@redhat.com>
Date: Wed, 01 May 2013 17:07:57 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: David Gibson <david@gibson.dropbear.id.au>
References: <1367288751-25163-1-git-send-email-aik@ozlabs.ru>
	<517F7368.8010908@redhat.com>
	<20130501032507.GL20202@truffula.fritz.box>
In-Reply-To: <20130501032507.GL20202@truffula.fritz.box>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c02::22e
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] memory: give name every AddressSpace
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
X-List-Received-Date: Wed, 01 May 2013 15:08:17 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Il 01/05/2013 05:25, David Gibson ha scritto:
>>> Applied to iommu branch, thanks.
> I don't see this patch at git://github.com/bonzini/qemu.git yet.
> Did you need to do something to push it out?

I just applied it locally for now.

Paolo
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJRgS/NAAoJEBvWZb6bTYbyr2wP/0SE8WDVpcteMf0oO+W/o1jg
nav1QqSiVWs6KbFR5uQsiLK3l+Rv1BKKf5FZoGiOSvHxyr7/tYpv6MmOAMYyKqVF
+KsYZ5J8snL9OyZviSkUPvmYF/v8+MZxBAMJHB5ryjpZoDk/4y5aT0LrPl6NLeqy
fkXToabzPFWHEWVwa6JkHgyS1IFxYM0zgobCv82TGypSAebded02BvrIzUV6jSI0
iEjIAKdZiSK2pdgHnZFRHqd0I8+NHjeSaXXX5YxhtE0R3uCMNoRBiam9t5aGVIYb
HLwGq94/ikf4gDnntkE6/J9zAwVcHltp97InGEhOQRP/71xgGjTbRVDn7v5kadwC
UMZzGA+fBVhI80Zjnb280hQVPHihgicO3koaaEkW6zBDGuCZZtr2yocQFnVYRZhH
CnQ5yUG6SZCgH+RlsIZ8mh/bEknH21+IF4xdTv5j3gSH8R5Y3I+l3KShTMDCcEfc
+ItrdQQLJXMlPXXRCeG6N1+Hkg1VpcnhGBpfIXqUTgfJtvGqi+TzEMqt8KGeIMEf
7YLfpHm7vd5kseBo6u85XScAcxPazfoSn8vTb0yFiU+YeSUstZzoAwoQg/7lzarB
1ouWvNrT9plNywg2aMGO34tCQCSCDwMlsQ47HMGxKiCTlVEczz758Xki1NAURCTy
uza3CdJb9OrYDQ5qeDOi
=jcUq
-----END PGP SIGNATURE-----

