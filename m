Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YbguI-0003XW-VS
	for mharc-qemu-trivial@gnu.org; Fri, 27 Mar 2015 22:55:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1YbguG-0003W4-GC
	for qemu-trivial@nongnu.org; Fri, 27 Mar 2015 22:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1YbguF-0003CA-Np
	for qemu-trivial@nongnu.org; Fri, 27 Mar 2015 22:55:28 -0400
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:33395)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>)
	id 1YbguD-0003Bd-Ip; Fri, 27 Mar 2015 22:55:25 -0400
Received: by oifl3 with SMTP id l3so90912689oif.0;
	Fri, 27 Mar 2015 19:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fe/uFX6H40R5NlzmyF2P6JTuJJM2ryrAQjfR+o1PAYE=;
	b=zUKnwxFNFmRAfkIn/Czp+ebU8fwJ9ZlXcn1jNBNY47/9CDEkQAY2gSr78A2fFZbL28
	G3w8W4qNJvBVE3SUJ788XTLZbeemxeaFqPnXQk5tQvOepha95QMzN2cR9R6vX+BnKK6A
	+5JUDhAAAPkD7q3lnqPMg/eQCLPiU+GbMP8HSw2m5osuzBMxWBFBI2dyrpKeGxI+5F3H
	5Jx4n6JO58BvnNdcorwzAtj9zuvEJWsgiD3bbUSli3CX7ynzKDF9yBeTBEbBAvdHkEbF
	Kb7Ud5EgRfquMSYE6fAAarMjqX9Y1h8sTw8vGKdXCwRJ+JgY9Q9K5+tf3MuicQugXq4E
	EnXw==
MIME-Version: 1.0
X-Received: by 10.60.112.65 with SMTP id io1mr18481656oeb.66.1427511324652;
	Fri, 27 Mar 2015 19:55:24 -0700 (PDT)
Received: by 10.76.75.4 with HTTP; Fri, 27 Mar 2015 19:55:24 -0700 (PDT)
In-Reply-To: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>
References: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>
Date: Sat, 28 Mar 2015 05:55:24 +0300
Message-ID: <CAMo8BfKN6EC48KoizmRqDtiZc6muKhzDKu3u8Jot2Ei-QmjMng@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
To: arei.gonglei@huawei.com
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c06::22e
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] microblaze: fix memory
	leak
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
X-List-Received-Date: Sat, 28 Mar 2015 02:55:29 -0000

On Thu, Mar 5, 2015 at 6:05 AM,  <arei.gonglei@huawei.com> wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>
> When not assign a -dtb argument, the variable dtb_filename
> storage returned from qemu_find_file(), which should be freed
> after use. Alternatively we define a local variable filename,
> with 'char *' type, free after use.
>
> Cc: Michael Tokarev <mjt@tls.msk.ru>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
> v2: fix a complier error.
> ---
>  hw/microblaze/boot.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

