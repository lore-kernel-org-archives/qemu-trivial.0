Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jt84F-0002rc-Bd
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jul 2020 07:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jt84B-0002qY-RL; Wed, 08 Jul 2020 07:16:44 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:41326 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jt842-0002us-Mj; Wed, 08 Jul 2020 07:16:42 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id F07E74C895;
 Wed,  8 Jul 2020 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1594206989;
 x=1596021390; bh=IZP5UhMNqaSvqAnZInLSw7aMUyR9UHa4g7mz2kaJfkI=; b=
 LwlLD4gqzKhmjDg+9WVU7o3CgUCt71MSdjCZREhDV0oSr58YKSEbnCG0ZNKD2k5K
 K3tD35qHsix1ygABezMpCKHuFTf4V8AvRtKhcuyU/eAfNtdtkJ65uJTKxajbTCNI
 E8KgP0bcTL3+zm7qxjuC99ogd006+TMn84nN/V+WM88=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGMWieCgyhvF; Wed,  8 Jul 2020 14:16:29 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id A617C4C889;
 Wed,  8 Jul 2020 14:16:25 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 8 Jul
 2020 14:16:25 +0300
Date: Wed, 8 Jul 2020 14:16:24 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Christophe de Dinechin <dinechin@redhat.com>
CC: <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, Laurent Vivier
 <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini
 <pbonzini@redhat.com>, =?iso-8859-1?Q?Herv=E9?= Poussineau
 <hpoussin@reactos.org>, Paul Durrant <paul@xen.org>, Richard Henderson
 <rth@twiddle.net>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter
 Lieven <pl@kamp.de>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 Riku Voipio <riku.voipio@iki.fi>, Alex =?iso-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, <qemu-arm@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, Max Reitz
 <mreitz@redhat.com>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau
 <marcandre.lureau@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, Ronnie
 Sahlberg <ronniesahlberg@gmail.com>, <xen-devel@lists.xenproject.org>, Marek
 Vasut <marex@denx.de>, Anthony Perard <anthony.perard@citrix.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Peter
 Chubb <peter.chubb@nicta.com.au>, Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, <qemu-trivial@nongnu.org>, Kevin Wolf
 <kwolf@redhat.com>, <qemu-ppc@nongnu.org>, <qemu-block@nongnu.org>, Artyom
 Tarasenko <atar4qemu@gmail.com>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Chris Wulff
 <crwulff@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Stefano Stabellini <sstabellini@kernel.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] trivial: Remove trailing whitespaces
Message-ID: <20200708111624.GA29018@SPB-NB-133.local>
References: <20200706162300.1084753-1-dinechin@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200706162300.1084753-1-dinechin@redhat.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/08 07:16:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 08 Jul 2020 11:16:45 -0000

On Mon, Jul 06, 2020 at 06:23:00PM +0200, Christophe de Dinechin wrote:
> There are a number of unnecessary trailing whitespaces that have
> accumulated over time in the source code. They cause stray changes
> in patches if you use tools that automatically remove them.
> 
> Tested by doing a `git diff -w` after the change.
> 
> This could probably be turned into a pre-commit hook.
> 

For HVF bits,

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman

