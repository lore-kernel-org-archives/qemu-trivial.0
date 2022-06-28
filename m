Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6821-00064r-Nl
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2022 06:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o681u-0005yA-25; Tue, 28 Jun 2022 06:01:13 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:44519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o681e-0004hb-50; Tue, 28 Jun 2022 06:01:05 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M5xDJ-1nzFKl2wwt-007Sso; Tue, 28 Jun 2022 12:00:48 +0200
Message-ID: <a433a77b-c22a-afa9-5b80-67098b881aba@vivier.eu>
Date: Tue, 28 Jun 2022 12:00:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/4] piix_ide_reset: Use pci_set_* functions instead of
 direct access
Content-Language: fr
To: Lev Kujawski <lkujaw@member.fsf.org>, qemu-trivial@nongnu.org
References: <20220528210250.175832-1-lkujaw@member.fsf.org>
 <20220528210250.175832-3-lkujaw@member.fsf.org>
Cc: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220528210250.175832-3-lkujaw@member.fsf.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QB8L/Hf7JFj0Rtw7LImGclAgnhIyGwK6burNGGhJbP0wbxMcT3r
 RJPrrI2KW6LEJxqxrhXU9PpTy1XM31rK7QTh2MkgyBJRiB945bQ17zwiU8lwkr5Aoh9x/04
 jerwkOfb475XgZmsXmWYUkFTcEnuHGBJxGnT2ZIIeTbd/80C1DIGDE1QWGK0qjJW14n4uWJ
 kKLlg/xv2ao98W0sIi7aQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L6LyS9Kv+vI=:IErAANAlYl0caFWjH4P/Gi
 WOTexCnta+qs38gzxyqKlgNZEz5/kFurWQ2rTe5zq1w0+vV8rGqvetLa2C8gq+Xmqt6nN1ouB
 5EuTXF4SLDVZgEnj+8VEuUSCGNSObZqhZ/LAJhUs+JYRCNFGnqWxW/0f516OmiBVt5hmN2XKQ
 /sY/TXbKAy9e9ICqONy7pUWIbPeEmLdtM8VbrV4UyTSkjrMDPz0PpPzg4d/dwjssXVauCy87g
 AddqY3s6+/gs8bFVmEKTPY88MvLV5tViSeTCrVMmEDqlX24iTkbuTJIdVNzg879nTLMcocXa/
 B1eFxteHVaz5/E04k+JpvwbV413YL2THbtsdyHh3KqO/KakUa94h/vqealWIrz4m3rAsZtjr4
 EX3syC5kHydbcC1HGth0e1XbtJmE/i3PmQ9FoBpk1sl00fgo3qBVU2kt2t7hhaUCz4OjEBflj
 HtDxPtUmiOMOd+siusPlI0OtOIP1L3H/N+wHfyGgr73qORpZHsC1p7/45pwaVYFqYRmdIlBP7
 aFgtWN94px8QzY6ocahbMyKoj8TuKQaVOMckmxoFYrV7ZZAhXvYQJJMVHFmnx3wnchuyxySMR
 34Mo0cQOADmoJ58249ol6RxFxYi5b199EaxDTrTZf0KAGLDJ1pGqgw+JqZ/hcqEGNLC7Uy176
 ALFT0841kFFlELXABAEAC58QbqYuFdEjgZep93/Etg1l/dQoX2L+wI25xsQupGQXqWc2DpOE3
 vYLYJg7lE7IGeor6w+ILqSqI2WR4q0t+gU60wA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 28 Jun 2022 10:01:16 -0000

CC:

John Snow <jsnow@redhat.com> (supporter:IDE)
qemu-block@nongnu.org (open list:IDE)

Le 28/05/2022 à 23:02, Lev Kujawski a écrit :
> Eliminates the remaining TODOs in hw/ide/piix.c by:
> - Using pci_set_{size} functions to write the PIIX PCI configuration
>    space instead of manipulating it directly as an array; and
> - Documenting default register values by reference to the controlling
>    specification.
> 
> Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
> ---
>   hw/ide/piix.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index ce89fd0aa3..76ea8fd9f6 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -21,6 +21,10 @@
>    * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>    * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>    * THE SOFTWARE.
> + *
> + * References:
> + *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
> + *      290550-002, Intel Corporation, April 1997.
>    */
>   
>   #include "qemu/osdep.h"
> @@ -114,14 +118,11 @@ static void piix_ide_reset(DeviceState *dev)
>           ide_bus_reset(&d->bus[i]);
>       }
>   
> -    /* TODO: this is the default. do not override. */
> -    pci_conf[PCI_COMMAND] = 0x00;
> -    /* TODO: this is the default. do not override. */
> -    pci_conf[PCI_COMMAND + 1] = 0x00;
> -    /* TODO: use pci_set_word */
> -    pci_conf[PCI_STATUS] = PCI_STATUS_FAST_BACK;
> -    pci_conf[PCI_STATUS + 1] = PCI_STATUS_DEVSEL_MEDIUM >> 8;
> -    pci_conf[0x20] = 0x01; /* BMIBA: 20-23h */
> +    /* PCI command register default value (0000h) per [1, p.48].  */
> +    pci_set_word(pci_conf + PCI_COMMAND, 0x0000);
> +    pci_set_word(pci_conf + PCI_STATUS,
> +                 PCI_STATUS_DEVSEL_MEDIUM | PCI_STATUS_FAST_BACK);
> +    pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>   }
>   
>   static int pci_piix_init_ports(PCIIDEState *d)


