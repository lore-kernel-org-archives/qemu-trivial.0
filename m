Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwTsN-0003AE-Cr
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 04:01:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1SwTsD-00038m-NU
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 04:01:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1SwTsC-0000sX-Le
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 04:01:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12728)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1SwTsC-0000r5-E0; Wed, 01 Aug 2012 04:01:40 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7181cwl018521
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 1 Aug 2012 04:01:38 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-22.ams2.redhat.com
	[10.36.112.22])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7181ZYm022565; Wed, 1 Aug 2012 04:01:35 -0400
Message-ID: <5018E25E.4010801@redhat.com>
Date: Wed, 01 Aug 2012 10:01:34 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Hannes Reinecke <hare@suse.de>
References: <1343714097-545-1-git-send-email-sw@weilnetz.de>
	<5017EE1D.8060908@suse.de> <5017EEFD.5070503@redhat.com>
	<5017EFC6.1050705@suse.de> <5017F0A2.5030400@redhat.com>
	<5017F1E3.90806@suse.de> <87y5m06jx1.fsf@codemonkey.ws>
	<5017FD81.3040707@redhat.com> <50185960.9050700@suse.de>
	<5018DCEB.9060208@redhat.com> <5018E0BE.3000706@suse.de>
In-Reply-To: <5018E0BE.3000706@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] megasas: Update function
	megasys_scsi_uninit
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
X-List-Received-Date: Wed, 01 Aug 2012 08:01:49 -0000

Il 01/08/2012 09:54, Hannes Reinecke ha scritto:
> On 08/01/2012 09:38 AM, Paolo Bonzini wrote:
>> Il 01/08/2012 00:17, Hannes Reinecke ha scritto:
>>> Ad 2: no, the SAS address for the devices is _not_ the WWN.
>>> The WWN is the ID of the LUN, whereas the SAS address is the ID of the
>>> Target. So to be correct we would need to generate unique SAS addressed
>>> per target which needs to be different from the WWN.
>>
>> Oh, that's even easier then, just delete all the get_wwn stuff and use
>> HBA address + 1 + sdev->id.
>>
> Which HBA address?

The HBA SAS address. :)

Paolo

