Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VX7qB-00041x-Hm
	for mharc-qemu-trivial@gnu.org; Fri, 18 Oct 2013 07:03:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1VX7q4-0003q7-O1
	for qemu-trivial@nongnu.org; Fri, 18 Oct 2013 07:03:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1VX7q0-00020i-4h
	for qemu-trivial@nongnu.org; Fri, 18 Oct 2013 07:03:28 -0400
Received: from mail-ea0-x231.google.com ([2a00:1450:4013:c01::231]:60653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1VX7po-0001xO-Ir; Fri, 18 Oct 2013 07:03:12 -0400
Received: by mail-ea0-f177.google.com with SMTP id f15so1842287eak.36
	for <multiple recipients>; Fri, 18 Oct 2013 04:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=e3fh4RmUhfb3LRt/jkBI2O8V43x8EDGy9tU+znT70wE=;
	b=hW/QFQs39O9Qoo6xFjyxAUpjlDAHVwdrAsXFPouva7iXYj/8hbNyTJ9Dlezi4oK4m4
	zqqd5SQEJlFSsXGDqeujzzvoZ5QYg9WH7jvsMZcOzOuWV7aSR4njV4yUkuMkx7zqAuNq
	uHfPA6ndazNXV8bN8SSw6HAYIsN7mKzPEdkUmeOyjSoadv9pIemCPc9JKKJ+EHRFmkNC
	cJDYuzrbwWRTQ13xgsfMp7liGdd6dIgBbi22YEFYUOnpyb2ZMIVApNeNhSVxe33whbmf
	B+nYC/ebEXZ/LoLaDig0MJNiXK5l+DywHSAZcqT0JaXxqp0mGGg7lpXH9zuadp0JhftU
	jjyg==
X-Received: by 10.14.2.200 with SMTP id 48mr1935241eef.88.1382094191479;
	Fri, 18 Oct 2013 04:03:11 -0700 (PDT)
Received: from localhost (178-27-179-241-dynip.superkabel.de. [178.27.179.241])
	by mx.google.com with ESMTPSA id e13sm3030778eeu.4.2013.10.18.04.03.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Oct 2013 04:03:10 -0700 (PDT)
Date: Fri, 18 Oct 2013 13:03:09 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20131018110309.GB15317@stefanha-thinkpad.redhat.com>
References: <1382037806-9393-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382037806-9393-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::231
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio: Remove unneeded
	memcpy
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
X-List-Received-Date: Fri, 18 Oct 2013 11:03:33 -0000

On Thu, Oct 17, 2013 at 09:23:26PM +0200, Stefan Weil wrote:
> Report from valgrind:
> 
> ==19521== Source and destination overlap in memcpy(0x31d38938, 0x31d38938, 64)
> ==19521==    at 0x4A0A343: memcpy@@GLIBC_2.14 (in
> /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==19521==    by 0x42774E: virtio_blk_device_init (virtio-blk.c:686)
> ==19521==    by 0x46EE9E: virtio_device_init (virtio.c:1158)
> ==19521==    by 0x25405E: device_realize (qdev.c:178)
> ==19521==    by 0x2559B5: device_set_realized (qdev.c:699)
> ==19521==    by 0x3A819B: property_set_bool (object.c:1315)
> ==19521==    by 0x3A6CE0: object_property_set (object.c:803)
> 
> Valgrind is right: blk == &s->blks, so it is a memcpy of 64 byte with
> source == destination which can be removed.
> 
> Reported-by: Dave Airlie <airlied@gmail.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/block/virtio-blk.c |    1 -
>  1 file changed, 1 deletion(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

