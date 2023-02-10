Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQTPx-0007rg-10
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2023 08:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pQTPi-0007jm-5U; Fri, 10 Feb 2023 08:26:06 -0500
Received: from hoth.uni-paderborn.de ([2001:638:502:c003::19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pQTPb-0005Za-Co; Fri, 10 Feb 2023 08:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8b3IPXKtHmhvD9Y+ITY5TArtBrGzwNUeWe4UQr3GNFU=; b=GuEBBre0u641QmahUAqX+y8TJi
 jQ2kXrvA19XiJpNtvJz8+YaRMIZyssSq7P+e6pYH4qiw+WAR2JUMhDkvRuV7lo4uA0CyiHoRcqjaI
 +zLpV1sqzlVrprmdA4zG/lBBx6MuTbNJaC5NqBf0FWOOBmM89XmNcTY7miWIl/0XekGg=;
Date: Fri, 10 Feb 2023 14:25:52 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] include/hw: Do not include hw.h from headers
Message-ID: <20230210132552.c5hf2fdpful6riy7@mustique.upb.de>
References: <20230210112835.1117966-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210112835.1117966-1-thuth@redhat.com>
X-IMT-Source: Intern
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.10.131520, AntiVirus-Engine: 5.97.0,
 AntiVirus-Data: 2023.2.10.5970001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::19;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=hoth.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Feb 2023 13:26:14 -0000

On Fri, Feb 10, 2023 at 12:28:35PM +0100, Thomas Huth wrote:
> This include is not needed here, so drop that line.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/hw/ssi/ibex_spi_host.h          | 1 -
>  include/hw/tricore/tricore_testdevice.h | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/include/hw/ssi/ibex_spi_host.h b/include/hw/ssi/ibex_spi_host.h
> index 8089cc1c31..5bd5557b9a 100644

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

