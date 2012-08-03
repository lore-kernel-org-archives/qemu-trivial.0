Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SxHtS-0004Ri-48
	for mharc-qemu-trivial@gnu.org; Fri, 03 Aug 2012 09:26:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SxHtL-00045x-DD
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2012 09:26:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SxHtH-000104-BG
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2012 09:26:11 -0400
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:47078)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SxHtF-0000zc-AG; Fri, 03 Aug 2012 09:26:05 -0400
Received: by lahc1 with SMTP id c1so339918lah.4
	for <multiple recipients>; Fri, 03 Aug 2012 06:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ovre/TxFu31XK7BcDIwtZ3Ex4XETxp0khJ8xmH91Ydc=;
	b=H8zXXTv0anU/dEmvpObHlfW0FZeSVqIlpR7U+MwC3wYsLBEj42PBuAMy0O5OopdTBD
	ab8Cl88ShActxEnaTC0JkxN46lJ85ElyEzOGa4WLSYCjPXsMX8e3NYHqVovlis9zNwDI
	btnZ9s8NO4blK+1UqKbCLcNcHLnfXQD8ormCLEJqhNMg04HLHv0l6DvrZTruEpYFSW2+
	SAylQbbKtoLa+iZ6NjMDwC984GNMGz18KZyzQc4SQD6JpI9MTe0rRwLnHVFK3mEB3F+E
	Q2MSW8OPIDormj81lXf4vdIolbr9p2VU6xlRBX8mf/yma6wrNYkv/BOq2POiSo9jRS7N
	Mjhg==
MIME-Version: 1.0
Received: by 10.112.46.166 with SMTP id w6mr644073lbm.100.1344000363996; Fri,
	03 Aug 2012 06:26:03 -0700 (PDT)
Received: by 10.112.71.73 with HTTP; Fri, 3 Aug 2012 06:26:03 -0700 (PDT)
In-Reply-To: <1343963182-28297-2-git-send-email-akong@redhat.com>
References: <1343963182-28297-1-git-send-email-akong@redhat.com>
	<1343963182-28297-2-git-send-email-akong@redhat.com>
Date: Fri, 3 Aug 2012 14:26:03 +0100
Message-ID: <CAJSP0QVFQ=xETJW6mhKV_LOH_WAAG6ayxaQOhJJpED64D7U9Ug@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Amos Kong <akong@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2 1/2] remove unused include of error.h
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
X-List-Received-Date: Fri, 03 Aug 2012 13:26:17 -0000

On Fri, Aug 3, 2012 at 4:06 AM, Amos Kong <akong@redhat.com> wrote:
> Signed-off-by: Amos Kong <akong@redhat.com>
> ---
>  qemu_socket.h |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

I have dropped this, see Luiz' comment.

Stefan

