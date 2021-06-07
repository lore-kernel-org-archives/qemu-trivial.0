Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqECx-0008TC-2M
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jun 2021 08:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lqECu-0008PL-J5; Mon, 07 Jun 2021 08:18:16 -0400
Received: from [201.28.113.2] (port=47825 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lqECs-0008ST-Q1; Mon, 07 Jun 2021 08:18:16 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 7 Jun 2021 09:18:10 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 5B11E801387;
 Mon,  7 Jun 2021 09:18:10 -0300 (-03)
Subject: Re: [PATCH] scripts/checkpatch.pl: process .c.inc and .h.inc files as
 C source
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20210520195142.941261-1-matheus.ferst@eldorado.org.br>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <bf17cd04-e964-b78b-278e-8b1f2c5554a2@eldorado.org.br>
Date: Mon, 7 Jun 2021 09:18:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520195142.941261-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Jun 2021 12:18:10.0587 (UTC)
 FILETIME=[2E4F7EB0:01D75B97]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 07 Jun 2021 12:18:16 -0000

On 20/05/2021 16:51, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Change the regex used to determine whether a file should be processed as
> C source to include .c.inc and .h.inc extensions.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   scripts/checkpatch.pl | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 3d185cceac..bbcd25ae05 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -12,7 +12,7 @@ use Term::ANSIColor qw(:constants);
>   my $P = $0;
>   $P =~ s@.*/@@g;
>   
> -our $SrcFile    = qr{\.(?:h|c|cpp|s|S|pl|py|sh)$};
> +our $SrcFile    = qr{\.(?:(h|c)(\.inc)?|cpp|s|S|pl|py|sh)$};
>   
>   my $V = '0.31';
>   
> @@ -1671,7 +1671,7 @@ sub process {
>   		}
>   
>   # check we are in a valid C source file if not then ignore this hunk
> -		next if ($realfile !~ /\.(h|c|cpp)$/);
> +		next if ($realfile !~ /\.((h|c)(\.inc)?|cpp)$/);
>   
>   # Block comment styles
>   
> 
ping

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

