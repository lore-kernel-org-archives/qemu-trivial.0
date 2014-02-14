Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEDIe-0000VE-UB
	for mharc-qemu-trivial@gnu.org; Fri, 14 Feb 2014 02:35:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WEDIY-0000RO-LT
	for qemu-trivial@nongnu.org; Fri, 14 Feb 2014 02:35:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WEDIU-0005Be-51
	for qemu-trivial@nongnu.org; Fri, 14 Feb 2014 02:34:58 -0500
Received: from mail-qg0-x22f.google.com ([2607:f8b0:400d:c04::22f]:58038)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WEDIU-0005BR-06; Fri, 14 Feb 2014 02:34:54 -0500
Received: by mail-qg0-f47.google.com with SMTP id 63so1702247qgz.6
	for <multiple recipients>; Thu, 13 Feb 2014 23:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=HSrjmf434yNQGbu+VihZi7Usfetz880zPvnwx8uSPLQ=;
	b=rF7mtcgaOfFC615fBzrA0kGhNo/lbwq3rvaMxefGjSqp5FKbKujejWINUuWXsBeo5q
	7jIWsw00ymt5n+Qn5kP3FEFbIVmUaVrpX63TA2vxou/iEcZQVd2hp7Z/Ke7nb8Ge+3iA
	Q4Ua9N+URHDVDI8+1ZuYeqKP2gA6UQnBeowdZ0qHhKZzhiC3WKK8Y0FZ8/jC4l0sdnIx
	fWk2mG1d3xczAVYUotgIUn1A90+fbnxdFmv46N5FyOMCFCw7mNTa2+WxyKgyQoqD9AiQ
	EH2x2PZOzi74z/ee0gCGvRN/3z+oQvGNXA9Rgi1v6q+/s9uKQ2DttkM18uuU+pgEGWUE
	jamA==
X-Received: by 10.224.11.136 with SMTP id t8mr10459479qat.26.1392363292999;
	Thu, 13 Feb 2014 23:34:52 -0800 (PST)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id p67sm6623308qgd.8.2014.02.13.23.34.49
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Feb 2014 23:34:51 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <52FDC715.3010102@redhat.com>
Date: Fri, 14 Feb 2014 08:34:45 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>, 
	Eduardo Habkost <ehabkost@redhat.com>
References: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>	<529CBE15.8010206@msgid.tls.msk.ru>
	<529D0533.7090402@suse.de>	<529D11C5.2080505@ozlabs.ru>
	<529DDD08.4030206@suse.de>	<20131203144740.GL22837@otherpad.lan.raisama.net>	<529EC2C3.3050703@ozlabs.ru>	<20131204124847.GK2340@otherpad.lan.raisama.net>
	<52FDBE32.2040005@ozlabs.ru>
In-Reply-To: <52FDBE32.2040005@ozlabs.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22f
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>,
	Wanlong Gao <gaowanlong@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [PATCH] vl: remove (max_cpus > 255) check from
 smp_parse
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
X-List-Received-Date: Fri, 14 Feb 2014 07:35:03 -0000

Il 14/02/2014 07:56, Alexey Kardashevskiy ha scritto:
>> >   Subject: [PATCH V17 04/11] NUMA: convert -numa option to use OptsVisitor
>> >   Message-Id: <1386143939-19142-5-git-send-email-gaowanlong@cn.fujitsu.com>
>> >   http://article.gmane.org/gmane.comp.emulators.qemu/244826
>
> Any progress with this? Thanks.

Yes, there was some progress though for some reason it happened onlist.

Igor/Wanlong, can you send the first patches of the "common" NUMA/memory 
series, i.e. excluding the memdev backend?

Paolo

