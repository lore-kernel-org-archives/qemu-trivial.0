Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBiDe-0000Ow-Kb
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2020 12:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57061)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jBiDb-0000Jj-Fe
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 12:59:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jBiDa-0007GT-Hs
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 12:58:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48685
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jBiDa-0007DZ-EA
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 12:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583859536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qvpyV2erkC9lJOF+fS1KQMIEU7oYtyY/QEcW4FtBQA=;
 b=BZqTeNuNf3MoFD0BzpOfsONPWpV5gMplxyLxjP8TGinhHtyy3Tfh05UM5C+0nArh6e3N74
 FN/74s0Ezy5Lnx8/ozqq1x/lBxTP6YdCjQXNMP6A0yhfhqg7zJfzADsp5DT5djD7NFh/FW
 JUKcL2nbzFO9es3zRsUwgo4IwQKjS60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-ZqkISmC2MMauo88sP3OAdQ-1; Tue, 10 Mar 2020 12:58:53 -0400
X-MC-Unique: ZqkISmC2MMauo88sP3OAdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF0DB1937FC0;
 Tue, 10 Mar 2020 16:58:51 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55FDD5D9C5;
 Tue, 10 Mar 2020 16:58:50 +0000 (UTC)
Date: Tue, 10 Mar 2020 17:58:48 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] tests/qemu-iotests: Fix socket_scm_helper build path
Message-ID: <20200310165848.GG6926@linux.fritz.box>
References: <20200306165751.18986-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200306165751.18986-1-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Tue, 10 Mar 2020 16:59:00 -0000

Am 06.03.2020 um 17:57 hat Philippe Mathieu-Daud=E9 geschrieben:
> The socket_scm_helper path got corrupted during the mechanical
> refactor moving the qtests files into their own sub-directory.
>=20
> Fixes: 1e8a1fae7 ("test: Move qtests to a separate directory")
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Thanks, applied to the block branch.

Kevin


