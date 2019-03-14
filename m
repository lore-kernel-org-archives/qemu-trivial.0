Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4Mgn-0004ac-TA
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2019 05:30:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h4MgT-00048H-Qd
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 05:29:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h4MYM-0005ri-Jb
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 05:21:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36526)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1h4MYM-0005qv-BY
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 05:21:30 -0400
Received: by mail-wm1-f67.google.com with SMTP id e16so1945993wme.1
	for <qemu-trivial@nongnu.org>; Thu, 14 Mar 2019 02:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=j7s7X9X2ePUlY8AWlCh0mv8lKPQ0fYIgWJNbiO8XFF0=;
	b=FnMYAqdHDWutcbsunDgXEnoXdyPuItKHwmwvfbAHSPzc7B5KOaQAdaJXv9Je3gcKH8
	egPqO7V40e/+Ie2JXjr+xtTNHVDrhA8LaIYS9foNqiMsjkvVdNQHcCXosbqBuptPFBbU
	VdMl5oe5+kK9H00oJdhjLihgh8tTn1NXNTkN92KtMri1OrGTE2A3p/qmUNFNiJwcjd0k
	JNNAlXUN+89kopdm2gKxhgTQGhOWL0K+1E4/C9SOYm4B9IWP8dqjdJgwUnPu348SFses
	vjVR+aZGLvybMZJGJhAv4RF1OhvY1TYfrCEOgBoaz3BFCyYcCjX9VzEkym+SmNzXwiuM
	YY8Q==
X-Gm-Message-State: APjAAAXkMQ+5SXxVGYKrfdo/9cZOJkgUGTga2iAVyZpEiCWZYe1hXUOw
	X0w6+oOvlc6RozFkJuLiszql3x1aYek=
X-Google-Smtp-Source: APXvYqz6X8Bbj9wMlu7cC4uvCeJK4MnlWmBc/EPGzcjlU/VBk1xSTopIRQqZG9eZI4abt1aDIYsjhw==
X-Received: by 2002:a1c:234d:: with SMTP id j74mr1636487wmj.130.1552555289258; 
	Thu, 14 Mar 2019 02:21:29 -0700 (PDT)
Received: from steredhat (host104-127-dynamic.53-79-r.retail.telecomitalia.it.
	[79.53.127.104])
	by smtp.gmail.com with ESMTPSA id c3sm2296179wrt.56.2019.03.14.02.21.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Mar 2019 02:21:28 -0700 (PDT)
Date: Thu, 14 Mar 2019 10:21:26 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20190314092126.pias3yogznjzoblr@steredhat>
References: <20190313144557.8845-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313144557.8845-1-eblake@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-4.0] maint: Ignore built
 elf2dmp
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
X-List-Received-Date: Thu, 14 Mar 2019 09:29:55 -0000

On Wed, Mar 13, 2019 at 09:45:57AM -0500, Eric Blake wrote:
> Commit 3fa2d384 added a binary 'elf2dmp' but did not ignore it
> during an in-tree build.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> Yes, I know we want to get rid of in-tree builds for 4.1; but
> for 4.0, this patch may still make sense.
> 
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

