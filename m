Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dmhlo-0003BZ-Oh
	for mharc-qemu-trivial@gnu.org; Tue, 29 Aug 2017 10:45:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1dmhlm-00038P-Dv
	for qemu-trivial@nongnu.org; Tue, 29 Aug 2017 10:45:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1dmhlh-0007ij-JM
	for qemu-trivial@nongnu.org; Tue, 29 Aug 2017 10:45:34 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:42846)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1dmhlU-0007XO-KC; Tue, 29 Aug 2017 10:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=LUzYb999xuZhu5j6m/LM4r5x23GqBdiLeyKV8gbvSVE=; 
	b=TXIaT0TikN1x6XedQ2bQDj86yBtJRIzdKSdeAgmHZ8a+dmnwtNgvPNKaL/7j73YzGxfrc9EZToKhxAcBmqr64kf8ueOEfh7+EZOsvx9LKw9xvBSlZtk0Gn7bywsB/reUA3RNvPPU15ibvOvOk+24MhRfpo0uOcMElQrZrqztAwWuNVFqysRlLYFGYl81HrIFFV9qh6PPJZeowauoVuEva9ubbNT/FUARusf0heoI9Q8xTKLyg+onXTTVaEajGzo6F+4vtmxQ78urqRXuUKHHc0U9Xgk5noBWkTB3XQmz7eNlRY7Zj6lZvniRiLMc40Hw9H+7sY1XIv+5CxJokRxTCw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1dmhlS-0002V2-7o; Tue, 29 Aug 2017 16:45:14 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1dmhlS-0006tH-5F; Tue, 29 Aug 2017 16:45:14 +0200
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	Max Reitz <mreitz@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
In-Reply-To: <ac13cdf8-7725-8d5a-9c8b-49ad51eba38e@redhat.com>
References: <20170829120836.16091-1-berto@igalia.com>
	<ac13cdf8-7725-8d5a-9c8b-49ad51eba38e@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Tue, 29 Aug 2017 16:45:14 +0200
Message-ID: <w51d17efn5x.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: Remove unused Error
 variables
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
X-List-Received-Date: Tue, 29 Aug 2017 14:45:35 -0000

On Tue 29 Aug 2017 04:40:35 PM CEST, Eric Blake wrote:

>> There's a few cases which we're passing an Error pointer to a

Hmmm... this was "few cases in which", but it seems that I accidentally
removed the "in". Not very important, but whoever commits this feel free
to fix the message.

Berto

