Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpUu2-0005Jk-SY
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jul 2019 05:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48640)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mlevitsk@redhat.com>) id 1hpUu0-0005AK-Bo
 for qemu-trivial@nongnu.org; Mon, 22 Jul 2019 05:46:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hpUtz-0000U9-D3
 for qemu-trivial@nongnu.org; Mon, 22 Jul 2019 05:46:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36114)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hpUtp-0000Ms-VA; Mon, 22 Jul 2019 05:46:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 38588300C72A;
 Mon, 22 Jul 2019 09:46:27 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66D975C206;
 Mon, 22 Jul 2019 09:46:25 +0000 (UTC)
Message-ID: <a8979dcc4affa9adc50c54e9c1b640dee3d09b83.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Michael Tokarev
 <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org,  qemu-block@nongnu.org
Date: Mon, 22 Jul 2019 12:46:24 +0300
In-Reply-To: <20190722094103.GA6583@localhost.localdomain>
References: <20190721181508.28608-1-mlevitsk@redhat.com>
 <20190721181508.28608-3-mlevitsk@redhat.com>
 <20190722094103.GA6583@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 22 Jul 2019 09:46:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 2/2] qemu-img: better error message when
 opening a backing file fails
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jul 2019 09:46:41 -0000

On Mon, 2019-07-22 at 11:41 +0200, Kevin Wolf wrote:
> Am 21.07.2019 um 20:15 hat Maxim Levitsky geschrieben:
> > Currently we print message like that:
> > 
> > "
> > new_file.qcow2 : error message
> > "
> > 
> > However the error could have come from opening the backing file (e.g when it missing encryption keys),
> > thus try to clarify this by using this format:
> > 
> > "
> > qemu-img: error creating new_file.qcow2: base_file.qcow2: error message
> > Could not open backing image to determine size.
> > "
> 
> The old error message was just unspecific. Your new error message can be
> actively misleading because you just unconditionally print the filename
> of the direct backing file, even though the error could have occurred
> while opening the backing file of the backing file (or even further down
> the backing chain).
> 
> It's a common problem we have with backing files and error messages: We
> either don't print the filename where the error actually happened (like
> in this case), or we print all of the backing files in the chain (such
> as "Could not open top.qcow2: Could not open mid.qcow2: Could not open
> base.qcow2: Invalid something").
> 
> Ideally, we'd find a way to print only the backing filename in such
> cases ("Could not open base.qcow2: Invalid something"). I'd gladly
> accept a patch that fixes error messages in this way for both open and
> create, but I'm afraid that your approach in this patch is too
> simplistic and not an improvement

You raise a very good point, I didn't thought about this.
Thanks,

Best regards,
	Maxim Levitsky



