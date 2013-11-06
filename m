Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VdyjZ-0003DQ-N8
	for mharc-qemu-trivial@gnu.org; Wed, 06 Nov 2013 03:45:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VdyjT-00032j-6d
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 03:45:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VdyjN-0000QS-6Y
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 03:44:59 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VdyjA-0000Bn-Vr; Wed, 06 Nov 2013 03:44:41 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 379454085D;
	Wed,  6 Nov 2013 12:44:39 +0400 (MSK)
Message-ID: <527A0176.1030708@msgid.tls.msk.ru>
Date: Wed, 06 Nov 2013 12:44:38 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Cole Robinson <crobinso@redhat.com>
References: <1d038bb1867cd9c72ba555ab40d4c891df71c5f5.1381506642.git.crobinso@redhat.com>
	<5279838F.8060008@redhat.com>
In-Reply-To: <5279838F.8060008@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, alex.williamson@redhat.com, mst@redhat.com,
	qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] pci-assign: Fix error_report of
 pci-stub message
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
X-List-Received-Date: Wed, 06 Nov 2013 08:45:05 -0000

> On 10/11/2013 11:52 AM, Cole Robinson wrote:
>> Using multiple calls to error_report here means every line is
>> prefaced with the (potentially long) pci-assign command line
>> arguments.
>>
>> Use a single error_printf to preserve the intended formatting.
>> Since this code path is always preceded by an error_report call,
>> we don't lose the command line reporting.

Thanks, applied to the trivial-patches queue.

/mjt

