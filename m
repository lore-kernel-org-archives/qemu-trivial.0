Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwEBS-0004yM-RV
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 11:16:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1SwEBM-0004dj-Cq
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:16:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1SwEBF-0002SF-DT
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:16:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1SwEBF-0002S2-5o; Tue, 31 Jul 2012 11:16:17 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6VFGFOD006618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 31 Jul 2012 11:16:15 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-21.ams2.redhat.com
	[10.36.112.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6VFGBwd005059; Tue, 31 Jul 2012 11:16:12 -0400
Message-ID: <5017F6BB.8020307@redhat.com>
Date: Tue, 31 Jul 2012 17:16:11 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1343714097-545-1-git-send-email-sw@weilnetz.de>
	<5017EE1D.8060908@suse.de> <5017EEFD.5070503@redhat.com>
	<5017EFC6.1050705@suse.de> <5017F0A2.5030400@redhat.com>
	<5017F1E3.90806@suse.de>
In-Reply-To: <5017F1E3.90806@suse.de>
Content-Type: text/plain; charset=ISO-8859-15
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	q6VFGFOD006618
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Hannes Reinecke <hare@suse.de>, Anthony Liguori <anthony@codemonkey.ws>
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
X-List-Received-Date: Tue, 31 Jul 2012 15:16:29 -0000

Il 31/07/2012 16:55, Andreas F=E4rber ha scritto:
>> > Exact knowledge of the requirements, basically. :)
> I.e. waiting on feedback about numeric constraints from Hannes? :)

Yeah, mostly which parts are 100% necessary and which are not.  Do you
need absolutely a WWN for each disk?

> Or waiting on general direction from Anthony?

No, we agreed on that.

> How to make progress there for 1.2 / Soft Freeze?

No possibility of regressions, so we can do it during hard freeze.  But
it is really a small task once we agreed on what has to be done.

Paolo

