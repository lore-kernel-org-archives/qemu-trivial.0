Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpCdg-0007Vs-Dc
	for mharc-qemu-trivial@gnu.org; Tue, 15 Dec 2020 10:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpCde-0007ST-0j
 for qemu-trivial@nongnu.org; Tue, 15 Dec 2020 10:53:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpCdc-0006at-9v
 for qemu-trivial@nongnu.org; Tue, 15 Dec 2020 10:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608047599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyEKU0dwSBSKCJOYKq05O7QkalWQFM+a6S5+rbCk1X8=;
 b=FW++b432ZEs7w1ZQjEmQO5OhcECxbVnipb5P7UWDxvjC27unWyduEj7C23k3jsxOK+jUMB
 m7L0JHTh7d4tjhcUVG4ORZ1TDgpN8xzG0iZuJQXQjucy6hH8eF9j1mchkEDgjBLyl8ocqh
 l4C0ZkbT65TTJQV5ItPaSixp8/ldG14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-jHenr3HkPBSBVP47vCfpcg-1; Tue, 15 Dec 2020 10:53:17 -0500
X-MC-Unique: jHenr3HkPBSBVP47vCfpcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83EAD107ACE3;
 Tue, 15 Dec 2020 15:53:16 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10FA11DB;
 Tue, 15 Dec 2020 15:53:14 +0000 (UTC)
Date: Tue, 15 Dec 2020 16:53:13 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3] hw/block/nand: Decommission the NAND museum
Message-ID: <20201215155313.GH8185@merkur.fritz.box>
References: <20201214002620.342384-1-f4bug@amsat.org>
 <CAFEAcA8eB=EC2=_BJYrg3kPWi9U7tqrgg2M0UiOjKcyzgJN10A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8eB=EC2=_BJYrg3kPWi9U7tqrgg2M0UiOjKcyzgJN10A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 15 Dec 2020 15:53:22 -0000

Am 14.12.2020 um 11:02 hat Peter Maydell geschrieben:
> On Mon, 14 Dec 2020 at 00:26, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> >
> > This is the QEMU equivalent of this Linux commit (but 7 years later):
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7025a43a9da2
> >
> >     The MTD subsystem has its own small museum of ancient NANDs
> >     in a form of the CONFIG_MTD_NAND_MUSEUM_IDS configuration option.
> >     The museum contains stone age NANDs with 256 bytes pages, as well
> >     as iron age NANDs with 512 bytes per page and up to 8MiB page size.
> >
> >     It is with great sorrow that I inform you that the museum is being
> >     decommissioned. The MTD subsystem is out of budget for Kconfig
> >     options and already has too many of them, and there is a general
> >     kernel trend to simplify the configuration menu.
> >
> >     We remove the stone age exhibits along with closing the museum,
> >     but some of the iron age ones are transferred to the regular NAND
> >     depot. Namely, only those which have unique device IDs are
> >     transferred, and the ones which have conflicting device IDs are
> >     removed.
> >
> > The machine using this device are:
> > - axis-dev88
> > - tosa (via tc6393xb_init)
> > - spitz based (akita, borzoi, terrier)
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > ---
> > v3: Do not manually convert tabs to space to avoid mistakes...
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks, applied to the block branch.

Kevin


