Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7NnC-0006qC-QC
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 08:59:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sfeldma@gmail.com>) id 1Z7HMT-0004bG-72
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 02:07:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sfeldma@gmail.com>) id 1Z7HMS-00063s-Bl
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 02:07:09 -0400
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:33768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sfeldma@gmail.com>) id 1Z7HMS-00063m-6P
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 02:07:08 -0400
Received: by oiyy130 with SMTP id y130so11162oiy.0
	for <qemu-trivial@nongnu.org>; Mon, 22 Jun 2015 23:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=preuDdEPD4IBUDus64hFZUqeTCTqJHwXVOFjrz++zdM=;
	b=bDyhFKa5k6oCICd7T+b6id2k9zq6Hl19Jis9uR/E7XAjE77FQ5PJabzETOBeXiGy+5
	M16zzXfAEZq5WfGJ+Vn6M2hifhCUh/ANwrLNCEwQVY8yjRez7vHj8VZZ5akNmZBLaWQa
	LgX20REJbxguc6xXDtzniRifftKa0SHcMzlu9QnFbuSVHzedNIGMfKK7Agx716N1j5+r
	CDQGNtUFrPs93Mi8yYZyX6wStFCXo7VDhzLh7MTT6h4u2UDDdClZ7wtign6Jao1+TTwv
	zKZRpVE2HhC8+MfB3hY3wY0Zg+FKUlOuI3SQ1j1aGLpMYDxGg/Oz4/08wAMB5sov7qLw
	lp0g==
X-Received: by 10.202.52.138 with SMTP id b132mr26616559oia.125.1435039627844; 
	Mon, 22 Jun 2015 23:07:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.56.212 with HTTP; Mon, 22 Jun 2015 23:06:48 -0700 (PDT)
In-Reply-To: <1435023111-8780-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1435023111-8780-1-git-send-email-zhang.zhanghailiang@huawei.com>
From: Scott Feldman <sfeldma@gmail.com>
Date: Mon, 22 Jun 2015 23:06:48 -0700
Message-ID: <CAE4R7bAXEXtHKsKHnFqbqXOf8sdHBSH_Mq4XyOXbZN4+G6aDpw@mail.gmail.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c06::235
X-Mailman-Approved-At: Tue, 23 Jun 2015 08:59:08 -0400
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>
Subject: Re: [Qemu-trivial] [PATCH] rocker: Fix memory leak reported by
	coverity
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
X-List-Received-Date: Tue, 23 Jun 2015 06:07:10 -0000

On Mon, Jun 22, 2015 at 6:31 PM, zhanghailiang
<zhang.zhanghailiang@huawei.com> wrote:
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>

Acked-by: Scott Feldman <sfeldma@gmail.com>

