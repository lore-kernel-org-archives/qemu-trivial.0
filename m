Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sgxQJ-0006mV-Mz
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2024 22:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wh1sper@zju.edu.cn>)
 id 1sgxQI-0006ld-HN; Wed, 21 Aug 2024 22:19:38 -0400
Received: from zg8tmtu5ljy1ljeznc42.icoremail.net ([159.65.134.6])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wh1sper@zju.edu.cn>)
 id 1sgxQD-0003pq-0a; Wed, 21 Aug 2024 22:19:37 -0400
Received: from NUC10i7FNH.. (unknown [101.82.68.47])
 by mail-app2 (Coremail) with SMTP id by_KCgCHIMt9n8ZmL2nvAg--.32260S2;
 Thu, 22 Aug 2024 10:16:36 +0800 (CST)
From: Haoran Zhang <wh1sper@zju.edu.cn>
To: philmd@linaro.org
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com,
 qemu-stable@nongnu.org
Subject: Re: Re: [PATCH] hw/display/vhost-user-gpu.c: fix
 vhost_user_gpu_chr_read()
Date: Thu, 22 Aug 2024 10:16:25 +0800
Message-ID: <20240822021629.127821-1-wh1sper@zju.edu.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: by_KCgCHIMt9n8ZmL2nvAg--.32260S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw17CFyrWrW8CF15GF17Jrb_yoWxAFb_ua
 10yFs3ur47Wrn29an3AF9Y9F4Sq3y7Gr4FvF9xJryIqFWUAF40vws3Cw1fAr1UCa1DKr98
 ua1ktrWvy34Y9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb7kYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4UMxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
 IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
 aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2l1vDUUUU
X-CM-SenderInfo: asssliaqzvq6lmxovvfxof0/1tbiAggTB2bDWKYK2AAJse
Received-SPF: pass client-ip=159.65.134.6; envelope-from=wh1sper@zju.edu.cn;
 helo=zg8tmtu5ljy1ljeznc42.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 22 Aug 2024 02:19:38 -0000

On 2024-08-20 18:37:24, Philippe Mathieu-Daudé wrote:
> On 20/8/24 05:04, Haoran Zhang wrote:
> > fix vhost_user_gpu_chr_read() where `size` was incorretly passed
> 
> Typo "incorrectly".

Thank you for pointing that out. I reviewed the message multiple times before sending it, but I didn't catch the typo.

> 
> > to `msg->flags`.
> > 
> > Signed-off-by: Haoran Zhang <wh1sper@zju.edu.cn>
> > ---
> >   hw/display/vhost-user-gpu.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 267f664658 ("hw/display: add vhost-user-vga & gpu-pci")
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


