Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjnk2-0007i4-T3
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 09:27:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bjnjw-0007cL-PA
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 09:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bjnjq-0001rG-A9
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 09:27:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bjnjf-0001jh-IN; Tue, 13 Sep 2016 09:26:51 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B27DC01BC88;
	Tue, 13 Sep 2016 13:26:51 +0000 (UTC)
Received: from [10.36.116.35] (ovpn-116-35.ams2.redhat.com [10.36.116.35])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8DDQmTY015015
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 13 Sep 2016 09:26:50 -0400
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1470900060-25821-1-git-send-email-thuth@redhat.com>
	<1471001434.22974.30.camel@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <65417ad4-e8ae-ac2e-09d2-d010373757cb@redhat.com>
Date: Tue, 13 Sep 2016 15:26:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1471001434.22974.30.camel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 13 Sep 2016 13:26:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/console: Fix non-working
 backspace key in monitor of gtk UI
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Sep 2016 13:27:13 -0000

On 12.08.2016 13:30, Gerd Hoffmann wrote:
> On Do, 2016-08-11 at 09:21 +0200, Thomas Huth wrote:
>> +    [Q_KEY_CODE_BACKSPACE] = QEMU_KEY_BACKSPACE,
> 
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

Gerd,

thanks for your R-b! Could you take this through your ui tree? Or should
it rather go through -trivial instead?

 Thanks,
  Thomas


