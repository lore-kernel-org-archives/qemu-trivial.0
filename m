Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcRzB-0003P6-RL
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 10:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1rcRz3-0003M7-3v; Tue, 20 Feb 2024 10:24:38 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1rcRyw-0006qO-Ld; Tue, 20 Feb 2024 10:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i6RY4gecdwbq1NUEYqmf3Ya4Lo6zn+ooot4wMwaeJKg=; b=RVlsvL7IcUXjsXoq69wBAessRd
 HpHv+eAa/rHcR5jMn1AD8tJNtN7xRjb0+KyQFLM4EPFGebeZEjwRE6whKreiKf/6b3lp4dWDpNWOD
 +tpmSaA0I/pCooM9q4DukA896H0fqBnFXUqnQFLSfAlzSrjg2OLQzeHiJQyBa0kpeMNI=;
Date: Tue, 20 Feb 2024 16:24:44 +0100
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Alessandro Di Federico <ale@rev.ng>
Subject: Re: [PATCH v1 18/21] hexagon: correct typos
Message-ID: <gz2izpqkk5fesny6rtnsqka65uhgicafs4kc5zwdkmjobgselr@rdln67afg2pr>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
 <10db19d340ac3f275900f315661904d1aa004949.1708419115.git.manos.pitsidianakis@linaro.org>
 <529a81a2-792f-4739-965e-6eecffa919b6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <529a81a2-792f-4739-965e-6eecffa919b6@linaro.org>
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 20 Feb 2024 15:24:41 -0000

On 20/02/24, Philippe Mathieu-Daudé wrote:
> On 20/2/24 09:52, Manos Pitsidianakis wrote:
> > Correct typos automatically found with the `typos` tool
> > <https://crates.io/crates/typos>
> > 
> > Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > ---
> >   target/hexagon/idef-parser/macros.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> 
Ah nice, havent seen the typos tool before!

Reviewed-by: Anton Johansson <anjo@rev.ng>

