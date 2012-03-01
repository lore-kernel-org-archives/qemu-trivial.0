Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S33cE-0000th-MY
	for mharc-qemu-trivial@gnu.org; Thu, 01 Mar 2012 05:52:06 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1S33c7-0000Xl-Iq
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2012 05:52:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1S33c1-0007mr-GE
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2012 05:51:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:6146)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1S33bE-0007fH-TO; Thu, 01 Mar 2012 05:51:05 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q21Ap1Nw017989
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 1 Mar 2012 05:51:01 -0500
Received: from rincewind.home.kraxel.org (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q21Aow4T019739; Thu, 1 Mar 2012 05:50:59 -0500
Message-ID: <4F4F5491.6030400@redhat.com>
Date: Thu, 01 Mar 2012 11:50:57 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <4F4F44D6.2020907@siemens.com>
In-Reply-To: <4F4F44D6.2020907@siemens.com>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Roy Tam <roytam@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] usb: Fix signature of stub
	usb_host_device_open
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
X-List-Received-Date: Thu, 01 Mar 2012 10:52:05 -0000

On 03/01/12 10:43, Jan Kiszka wrote:
> -USBDevice *usb_host_device_open(const char *devname)
> +USBDevice *usb_host_device_open(USBBus *bus, const char *devname)

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd

