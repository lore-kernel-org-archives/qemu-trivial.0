Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U0UmF-0007LR-Hn
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2013 05:20:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0UmB-00079L-RN
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2013 05:20:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0Um8-0002Bg-Db
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2013 05:20:19 -0500
Received: from mail-ee0-f49.google.com ([74.125.83.49]:46408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U0Ulw-0001yV-Us; Wed, 30 Jan 2013 05:20:05 -0500
Received: by mail-ee0-f49.google.com with SMTP id d4so698104eek.36
	for <multiple recipients>; Wed, 30 Jan 2013 02:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=E3QrKXs9s2HUtMAkV4iRMcAxFenATobwJZPgwjAPFXM=;
	b=E6PKFwe5R1NzFJYgPJKIq3UcQJk3fZZTv+Svu6hcLw7pwfrni+3IphBGVsfoPQ8ChD
	oClMjosG5tzK46UteHGtK04nMbg6RjWGuz6EMJY0yyA9aFaj1Q4rmYyVXtnQEBgnI2WU
	IJrs0Zz3VUrDlk/7BGLAcDOZkXmQL5qtrJWyKzVaKo25fTVnJ4pdUWKsG5flJMPMipuL
	6pySB9RVzB9dNPIXtjNtLMwGDkSQC3whzU+H8CEwfk3gA1uMAX5Tg7tY5WfOHwYg+Llp
	bu/GTCAN4gI3weIGD2RuyA4IGR2guscUMxCJR+hXdVxNpkz7wjl49XCVibFU2WoyH9oz
	AkIw==
X-Received: by 10.14.198.198 with SMTP id v46mr13889053een.4.1359541202393;
	Wed, 30 Jan 2013 02:20:02 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id h5sm1252552eem.1.2013.01.30.02.20.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 02:20:01 -0800 (PST)
Date: Wed, 30 Jan 2013 11:19:59 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <20130130101959.GA30153@stefanha-thinkpad.redhat.com>
References: <8f03011d18d9d8cb51a4c2339f2ae4be7cfe1052.1359478671.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f03011d18d9d8cb51a4c2339f2ae4be7cfe1052.1359478671.git.mprivozn@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.49
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] qmp-commands.hx:
 s/tray-open/tray_open/ to match qapi schema
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
X-List-Received-Date: Wed, 30 Jan 2013 10:20:22 -0000

On Tue, Jan 29, 2013 at 05:58:41PM +0100, Michal Privoznik wrote:
> Currently, we are using 'tray_open' in QMP and 'tray-open' in
> HMP. However, the QMP documentation was mistakenly using the
> HMP version.
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

