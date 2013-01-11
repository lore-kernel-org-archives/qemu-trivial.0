Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TtaO1-0007Bg-3L
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2013 03:54:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1TtaNx-0007Aj-3I
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:54:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1TtaNv-0007AV-Mz
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:54:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1TtaNv-0007AQ-EB; Fri, 11 Jan 2013 03:54:43 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0B8sfUY020847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 11 Jan 2013 03:54:41 -0500
Received: from rincewind.home.kraxel.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0B8sdEC012316; Fri, 11 Jan 2013 03:54:40 -0500
Message-ID: <50EFD34F.4090009@redhat.com>
Date: Fri, 11 Jan 2013 09:54:39 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.11) Gecko/20121116 Thunderbird/10.0.11
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1357671140-21713-1-git-send-email-lersek@redhat.com>
	<20130111084822.GF23656@stefanha-thinkpad.muc.redhat.com>
In-Reply-To: <20130111084822.GF23656@stefanha-thinkpad.muc.redhat.com>
X-Enigmail-Version: 1.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Makefile: install the "acpi-dsdt.aml"
 and "q35-acpi-dsdt.aml" blobs too
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
X-List-Received-Date: Fri, 11 Jan 2013 08:54:48 -0000

On 01/11/13 09:48, Stefan Hajnoczi wrote:
>> > +acpi-dsdt.aml q35-acpi-dsdt.aml \
> I'm not familiar with the ACPI stuff and how we want to ship it.
> 
> Gerd or Anthony: Please review this patch.

Patch is correct, just picked it up and stuffed into a q35 poll req.

cheers,
  Gerd


