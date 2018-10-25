Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFgAs-0001Qe-RN
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 09:59:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFgAo-0001PI-8A
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:59:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFgAi-00017b-AE
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:59:42 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:60481)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFgAe-00010L-SA; Thu, 25 Oct 2018 09:59:34 -0400
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1N8GhM-1fT80W1egi-014CKn; Thu, 25 Oct 2018 15:59:20 +0200
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1N8GhM-1fT80W1egi-014CKn; Thu, 25 Oct 2018 15:59:20 +0200
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-6-crosa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <620802c3-e3e9-f89d-63dc-07928dc0cd85@vivier.eu>
Date: Thu, 25 Oct 2018 14:59:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-6-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:U6jGMd/+NInWOIoZtuVXDzSPAu/vkRmPHsqe96hVlYdYSzF4wDL
	iYbXqlR7qlS0DALQe86LfbXX2lfOvtos5PURIgXa56U1C+URWTf1VJ+uMxr2cnLVZaGSVMu
	TwnNgAeU7lxZBibcPZvxXc1Dj38bRrozTYEU06bXR/V+1gHKuDrzh4D+JXYjBGmZloklLZA
	bGcCxv+1H7mYR8hlijREA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:C5+yMRq626E=:aC9XUxscRqfkYw7sAPBRJl
	/uPFsrAHT8dhqy1KcIeAUVQYLAYfr/HwoRhst0z0gc+I/w+1VH1wcXn3vaN9ygO8iO5+BrRMx
	9N+pGHu7CgyX5BTwFruePxxUddphcejUyl01bJcwwpf1sGFwjf/EnBQ3cqJxwJHVorGIpwqOx
	88FD4OGd7Nrzcg9rzt9sf14REs0/CWL9uXbHNTTFs6r8Do7AYyGDyCn5WOADiLCGpE0eH2YZe
	sZd/ix7yqxKOTff7/gueMMxxjxhfeFS6CLZ05eAkQeF7703EYMUJ7Rlf/XJz5W2+EWBDNAUqQ
	2desxUxppmEBcDi+1rPV40sQcsXrACUE9anGjQpsyu+aRdJfyXnt4KVBS6y8o9pTJMBYmPzqv
	kWQOIR+s2FwYczwzdXcV7B9uSElEtv2MU0qL1qFiroG2Lq804C2i264MuL9ni5ffl5tJ4pVJp
	jpAmvhMRZU2F9M8Bw8WPJO7n5Pyn8ljrfoSQn9Gc4m8mt6g+hNdAjBCExtJoTAJZEfGGa6WMM
	vK5R0wJ+zDquk+WhUYwEqUwb97bpnfZSOZbE0EWH211w6t2MR+txDcrVbVIoeA7oWFiSf+B0/
	drTsYsDsZuoc44z3mR4YjShCii9VtvBh4x3qhpeBSTHF/oPI6ylj74qp7I/sZlDw90qRVhuDB
	7k3jtt7yHL+lM00xxA8MlL3/A/H+w7o6SUsIHctuX7iCULl5VAD+qHXvPkc7iFyoQ3TUUsarU
	iL1SXcyieFVFiomk
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [PATCH 05/10] docs/devel/testing.rst: add
 missing newlines after code block
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Oct 2018 13:59:45 -0000

On 04/10/2018 17:18, Cleber Rosa wrote:
> The line immediate following a ".. code::" block is considered
> to contains arguments to the "code directive".  The lack of a
> new line gives me during at parse time:
> 
>    testing.rst:63: (ERROR/3) Error in "code" directive:
>    maximum 1 argument(s) allowed, 3 supplied.
> 
>    .. code::
>      make check-unit V=1
> 
>    testing.rst:120: (ERROR/3) Error in "code" directive:
>    maximum 1 argument(s) allowed, 3 supplied.
> 
>    .. code::
>      make check-qtest V=1
> 
> Let's add the missing newlines, both for consistency and to
> avoid the parsing errors.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  docs/devel/testing.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 727c4019b5..9355ad49f2 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -61,6 +61,7 @@ variable (which affects memory reclamation and catches invalid pointers better)
>  and gtester options. If necessary, you can run
>  
>  .. code::
> +
>    make check-unit V=1
>  
>  and copy the actual command line which executes the unit test, then run
> @@ -118,6 +119,7 @@ and using gdb on the test is still simple to do: find out the actual command
>  from the output of
>  
>  .. code::
> +
>    make check-qtest V=1
>  
>  which you can run manually.
> 

Applied

Thanks,
Laurent

