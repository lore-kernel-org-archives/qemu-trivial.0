Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwDmC-0002oB-8K
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 10:50:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1SwDm7-0002mx-0i
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:50:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1SwDm3-0000Tq-2O
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:50:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1SwDm2-0000Tg-QS; Tue, 31 Jul 2012 10:50:14 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6VEoDuf011961
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 31 Jul 2012 10:50:14 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-21.ams2.redhat.com
	[10.36.112.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6VEoBov017636; Tue, 31 Jul 2012 10:50:11 -0400
Message-ID: <5017F0A2.5030400@redhat.com>
Date: Tue, 31 Jul 2012 16:50:10 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1343714097-545-1-git-send-email-sw@weilnetz.de>
	<5017EE1D.8060908@suse.de> <5017EEFD.5070503@redhat.com>
	<5017EFC6.1050705@suse.de>
In-Reply-To: <5017EFC6.1050705@suse.de>
Content-Type: text/plain; charset=ISO-8859-15
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	q6VEoDuf011961
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] megasas: Update function
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
X-List-Received-Date: Tue, 31 Jul 2012 14:50:22 -0000

Il 31/07/2012 16:46, Andreas F=E4rber ha scritto:
> > > Why would megasas be in master but not compiled/linked?
> > Because Anthony objected to how it picks the initiator WWN.
> Ah, anything keeping us from fixing that? :)

Exact knowledge of the requirements, basically. :)

Paolo

