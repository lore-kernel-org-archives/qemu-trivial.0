Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOUHa-00081d-Nw
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 11:44:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOUHT-0007rP-QV
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 11:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOUHN-000695-O7
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 11:44:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35600)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOUHB-00062V-HK; Fri, 14 Mar 2014 11:44:01 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C682D41C8B;
	Fri, 14 Mar 2014 19:43:52 +0400 (MSK)
Message-ID: <532323B8.2030807@msgid.tls.msk.ru>
Date: Fri, 14 Mar 2014 19:43:52 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Cole Robinson <crobinso@redhat.com>
References: <1394807976-9469-1-git-send-email-lersek@redhat.com>
	<1394807976-9469-2-git-send-email-lersek@redhat.com>
	<53231549.3090606@redhat.com>
In-Reply-To: <53231549.3090606@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [trivial PATCH 2.0 1/1] sasl: Avoid 'Could not
 find keytab file' in syslog
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
X-List-Received-Date: Fri, 14 Mar 2014 15:44:25 -0000

14.03.2014 18:42, Cole Robinson wrote:
> On 03/14/2014 10:39 AM, Laszlo Ersek wrote:
[..]
>> Since the default keytab file "/etc/qemu/krb5.tab" is usually absent, the
>> cyrus-sasl library emits a warning to syslog at startup, which tends to
>> annoy users (who didn't ask for gssapi in the first place).
>>
>> Comment out the keytab specification per default.
>>
>> "qemu-doc.texi" already correctly explains how to use "mech_list: gssapi"
>> together with "keytab:".

Thanks, applied to the trivial patches queue...


> ACK, libvirt has carried a similar change in their sasl config for a while now.

Is that an "ACKed-by:" ? :)

Thanks,

/mjt

