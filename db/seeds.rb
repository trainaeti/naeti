# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.create!(:email=>"support@dblsystems.com", :password=>"testtest1", :admin=>1, :instructor=>1, :first_name=>"Justa", :last_name=>"Testuser", :address=>"123 Anystreet", :city=>"Anytown", :state=>"36", :zip=>"01111")

User.create(:email=>"info@naeti.com", :password=>"testtest1", :admin=>1, :instructor=>1 )
User.update_all("admin = 1, instructor=1")

CourseCategory.create(:name=>"Asbestos")
CourseCategory.create(:name=>"Safety-OSHA")
CourseCategory.create(:name=>"Hazardous Materials")
CourseCategory.create(:name=>"Indoor Air Quality ")
CourseCategory.create(:name=>"Other")

ContentBlock.create(:name=>"About Us", :body=>"")
ContentBlock.create(:name=>"Consulting Opportunities", :body=>"")
ContentBlock.create(:name=>"Contact", :body=>"")
ContentBlock.create(:name=>"Course Dates", :body=>'<div id="inner" style="height:600px">
	<ul id="list">
		<li><a href="#">PRINT/VIEW ASBESTOS COURSE DATES</a></li>
		<li><a href="#">PRINT/VIEW LEAD COURSE DATES</a></li>
		<li><a href="#">PRINT/VIEW HAZARDOUS MATERIAL & SAFETY TRAINING COURSE DATES</a></li>
		<li><a href="#">PRINT/VIEW INDOOR AIR QUALITY COURSE DATES</a></li>
		<li><a href="#">TO SUBSCRIBE FOR COURSE UPDATES CLICK HERE</a></li>
	</ul>

</div><!-- end inner div for bg color-->')
ContentBlock.create(:name=>"Directions", :body=>'<div id="inner">
	<div id="directions" style="padding:15px 30px">
		
		<p>For the print version, <a href="#">click here</a></p>

		<p><strong>NAETI <br>
		3321 Doris Avenue, Building B <br>
		Ocean Township, NJ 07712 <br>
		Tel (732) 531-5571 <br>
		Fax (732) 531-5956</strong></p>
		<p>
		<strong>From the Garden State Parkway North:</strong><br>
		Garden State Parkway South to Exit 102. Stay to the right at the end of the ramp. Take the Asbury Avenue East (turns into Route 66 East) to the Asbury Circle to Route 35 North. After second traffic light (Sunset Avenue), make the second right onto Doris Avenue. We are on the left hand side of the street, second driveway. </p>

		<p>
		<strong>From the Garden State Parkway South:</strong><br>
		Garden State Parkway North to Exit 100A. Route 66 East to Route 35 North. After second traffic light (Sunset Avenue), make the second right onto Doris Avenue. We are on the left hand side of the street, second driveway. </p>

		<p>
		<strong>Directions from Pennsylvania:</strong><br>
		Pennsylvania Turnpike to Exit 6 (New Jersey Turnpike) to Exit 7A (Shore Areas) to Route 195 East, approximately 30 minutes to Exit Route 18 North (Eatontown) to Exit 10A (Asbury Park) onto Route 66 East to Asbury Circle to Route 35 North. After second traffic light (Sunset Avenue), make the second right onto Doris Avenue. NAETI is on the left hand side of the street (blue roof)</p>

		<p>
		<strong>Directions from Trenton</strong> <br>
		Route 195 East approximately 30 minutes to Exit onto Route 18 North (Eatontown) to Exit 10 (Asbury Park) onto Route 66 East to Asbury Circle to Route 35 North. After second traffic light (Sunset Avenue), make the second right onto Doris Avenue. We are on the left hand side of the street (blue roof) </p>
		
		
	
	</div>
</div><!-- end inner div for bg color-->')
ContentBlock.create(:name=>"Meet the Staff", :body=>'<div id="inner">
	<div id="staff" style="padding:15px 30px">
		
		<h2>Doris L. Adler - CEO</h2>
		<p>
		Founder and President of the National Asbestos & Environmental Training Institute (NAETI), with headquarters in New Jersey, has been a leader in the field of environmental awareness and control since 1985. A graduate of Adelphi University, with her BS in Education, Ms. Adler is well-known nationally for her leadership in the field of environmental education. Her company was one of the first training providers approved by the New Jersey Department of Health to offer both asbestos and lead training courses in New Jersey.</p>

		<p>Now, NAETI’s environmental training programs are provided nationally and internationally. She was instrumental in creating standards for the asbestos abatement and lead industries and currently has created a new division, National Environmental Training Institute (NETI), focusing on healthy building issues dealing exclusively with Building Sciences.</p>

		<p>She was a Project Team member for National Environmental Training Association (NETA) under a grant from HUD & the EPA for the national model maintenance worker training now marketed by HUD-User. Doris Adler is often asked to be the expert speaker on matters pertaining to training and has written numerous articles on same.</p>

	<p>	Past Chair of the Training and Qualifications Committee of the National Lead Abatement Council (NLAC), and Past Chair of the ASI/NLAC National Exam Project. Past Treasurer of NLAC Board of Trustees and Board Member. Board Member of the newly established NY Metro Chapter of the American Indoor Air Quality Council.</p>
	
	<h2 style="margin-top:20px">Office Staff</h2>
	<p>
		Doris L. <strong>Adler President</strong> <br>
		Jacob H. Paster <strong>Senior Advisor</strong> <br>
		Wayne M. Smith <strong>Associate Director </strong><br>
		Barbara Zebora <strong>Marketing Director</strong><br>
		Connie L. Brown <strong>Training Coordinator</strong><br>
		Nancy Marucci-Pizzuta <strong>Financial Advisor </strong><br>
		Diane Rasmussen <strong>Bookkeeper </strong>
	</p>
	<h2 style="margin-top:20px">Consulting Staff (Instructors)</h2>
	<p>
		Kenneth E. Balbi, M.D. 
		<strong>President, "E" The Solution, Inc.</strong>
		<br><br>
		Joseph Arcoleo, C.S.P., C.H.M.M.
		<br><br>
		Deborah J. Brandt, CMRS 
		<strong>President, Brandt Instruments, Inc. </strong>
		<br><br>
		Michael Cassidy
		<strong>President, Professional Environmental Services, Inc.</strong>
		<br><br>
		Don DeCaro, CET, CUSA 
		<br><br>
		Alex Fischberg
		<strong>Applied Science Associates </strong>
		<br><br>
		Steven Gladstone, MS, CIH, SCP, CHMM 
		John B. Glass, Jr., MS, CIH, CSP, CHMM
		<strong>Tyler Scientific </strong>
		<br><br>
		Jovan Hinic, IH 
		<br><br>
		Chris Lovelace, IH
		<strong>KTA-TATOR, Inc.</strong>
		<br><br>
		Timothy J. McCuen, Esq. 
		<br><br>
		Joseph Miller, CIH
		<strong>University of Delaware</strong>
		<br><br>
		Jose Montas
		<strong>President, All State Environmental </strong>
		<br><br>
		Myles O’Malley
		<strong>Founder, CLPER </strong>
		<br><br>
		Edward Olmsted, MS, CIH, CSP
		<strong>President, Olmsted Environmental Services, Inc. </strong>
		<br><br>
		Jacob H. Paster
		<strong>Vice President, Radiation Monitoring Devices, Inc. </strong>
		<br><br>
		Robert A. Politzer, MA, MS 
		<strong>Principal, Healthy Home Environmental </strong>
		<br><br>
		Ronald Rominski 
		<strong>Consultant </strong>
		<br><br>
		Susan Rosmarin, Esq.
		Stryker, Tams & Dill
		<br><br>
		Herman Sabath, Ph.D., MPH, CMC
		<strong>President, International Environmental Diagnostics, Inc. </strong>
		<br><br>
		Gerald Schwartz, CSP, CIH 
		<br><br>
		Eric Shapiro, M.A., CIAQP, CMRS 
		<strong>President, IAQ, Inc. </strong>
		<br><br>
		Lloyd Smith, Ph.D. 
		<strong>Vice President, CCC&L </strong>
		<br><br>
		Wayne Smith, IH, CRMI, CMRS, CMC
		<strong>Associate Director, NAETI </strong>
		<br><br>
		Nick Stecky, C.E.M., LEED Accredited Professional
		Gary Tinklenberg
		<strong>President, CCC&L</strong>
		<br><br>
		Kelly Walton, IH
		<strong>Tiger Environmental</strong>
		<br><br>
		Lee Wasserman
		<strong>LEW Corporation </strong>
		<br><br>
		John Zilka
		<strong>President, Applied Systems, Inc. </strong>
		<br><br>
		<strong>GUEST SPEAKERS</strong>
		<br><br>
		Jason Dobranic, Ph.D.
		<strong>National Director of Microbiology, EMSL Analytical, Inc.</strong>
	</p>
	</div>
</div><!-- end inner div for bg color-->')
ContentBlock.create(:name=>"News", :body=>"")
ContentBlock.create(:name=>"On-Site Training", :body=>"")
ContentBlock.create(:name=>"Photo Gallery", :body=>'<div id="inner">
	<div id="onsite_training" style="padding:15px 20px">
		
		<div id="asset_box">
			<ul id="gallery">
				<li><a href="http://naeti.com/Class2Edit.jpg"><img src="http://naeti.com/Class2Edit.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/Class3Edit.jpg"><img src="http://naeti.com/Class3Edit.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/Dr.SabathEdit.jpg"><img src="http://naeti.com/Dr.SabathEdit.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/Class4Edit.JPG"><img src="http://naeti.com/Class4Edit.JPG" alt=""></a></li>
				<li><a href="http://naeti.com/AsbestosClassCanada.jpg"><img src="http://naeti.com/AsbestosClassCanada.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/Class2Edit.jpg"><img src="http://naeti.com/Class2Edit.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/AsbestosClassSingapore1.jpg"><img src="http://naeti.com/AsbestosClassSingapore1.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/AsbestosDecon.jpg"><img src="http://naeti.com/AsbestosDecon.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/AsbestosGlovebag.jpg"><img src="http://naeti.com/AsbestosGlovebag.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/HermanStachyEdit.jpg"><img src="http://naeti.com/HermanStachyEdit.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/HermanClass.jpg"> <img src="http://naeti.com/HermanClass.jpg" alt=""> </a></li>
				<li><a href="http://naeti.com/AsbSupervisorDon.jpg"> <img src="http://naeti.com/AsbSupervisorDon.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/KeanUniversity.jpg"> <img src="http://naeti.com/KeanUniversity.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/Handson1.jpg"> <img src="http://naeti.com/Handson1.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/Handson3.jpg"> <img src="http://naeti.com/Handson3.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/Handson4.jpg"> <img src="http://naeti.com/Handson4.jpg" alt=""></a></li>
				<li><a href="http://naeti.com/Handson5.jpg"> <img src="http://naeti.com/Handson5.jpg" alt=""></a></li>
			</ul>
		</div><!-- end asset_box-->
	</div>
</div><!-- end inner div for bg color-->')
ContentBlock.create(:name=>"Qualification Statement", :body=>'<div id="inner">
	<div style="padding:15px 30px">
		<p>
		NATIONAL ASBESTOS & ENVIRONMENTAL TRAINING INSTITUTE (NAETI), one of the longest established environmental and technical training companies in the country, was founded in 1985. As an educational organization originally dedicated to asbestos abatement and management training, NAETI was initially founded to provide training for asbestos workers, contractors and consultants. NAETI\'s curriculum has evolved not only to cover all asbestos-related areas, but also to provide key training in many other safety and environmental areas as required by federal, state, and local regulations.
		</p>
		<p>
			NAETI offers more than 60 initial and refresher courses covering topics related to asbestos, lead, indoor environmental quality, health and safety, construction, personal protection, environmental energy efficiency design, hazardous material handling and clean-up, confined space/lock-out tag-out, right to know, and various other OSHA/NIOSH and customized training.
		</p>
		<p>
		Our teaching staff features internationally recognized experts whose experience and knowledge are integrated into all course materials. NAETI provides an ergonomic classroom setting, in a state-of-the-art hands-on facility.
	</p>
	<p>
		NAETI specializes in customizing its training to each client’s specific requirements. Our courses are well attended by individuals from the private and industrial sectors, as well as schools and universities, hospitals, and municipal, state, and federal agencies. We travel to our clients throughout the United States and internationally providing customized training. NAETI can help you meet all your environmental, health and safety training needs.
		</p>
	
	</div>
</div><!-- end inner div for bg color-->')
ContentBlock.create(:name=>"Testimonials", :body=>'<div id="inner">
	<div id="testimonial" style="padding:15px 30px">
		<h2>2-DAY INDOOR ENVIRONMENTAL QUALITY INVESTIGATION WORKSHOP </h2>
		<blockquote>
		NAETI and its instructors provide an excellent program on the topic of IAQ. Very insightful
		</blockquote>
		<p>Nadino Bello, New Wave Consultants, Inc. (973) 616-4601 newwaveenvironmental.com </span>
		</p>
		<blockquote>
		Presentation was clear, direct, informative and conducted extremely well.
		</blockquote>
		<p>
		Anonymous 
		<p>
		<h2>CERTIFIED MICROBIAL REMEDIATION SUPERVISOR (CMRS)</h2>

		<blockquote>
		I would strongly encourage anyone in this Industry to participate in this class or one similar
		</blockquote>
		<p>
		Steve Madias, Alpha Omega Environmental (954) 427-8586 
		</p>
		<blockquote>The BEST instructor I had in 13 years!</blockquote>
		<p>Timothy Sheehan, Spectrum </p>

		<blockquote>The knowledge and teaching skills of the instructor created an interesting and enlightening course.</blockquote>
		<p>James A. Grutzmacher, EMGC, Inc. (203) 924-9544</p>

		<blockquote>I felt the instructor was excellent and was responsible to cover a lot of material in a small frame of time.</blockquote>
		<p>Michael Trogler, Aulson Company, Inc. (978) 815-1136</p>

		<blockquote>I enjoyed the instructors for their combined knowledge and presentation of the material.</blockquote>
		<p>William McGee, Sunrise Systems of Breward, Inc. (321) 636-1618</p>

		<blockquote>Great Class, very informative, would recommend to anybody to take the class.</blockquote>
		<p>Christopher L. Kelley, Hepaco, Inc. www.hepaco.com (901) 345-6333</p>

		<blockquote>Very informative and practical</blockquote>
		<p>Frederic Culleton, D.P.C. General Contracting, Inc. (800) 488-0447</p>

		<blockquote>The course provided great information on a topic that has many questions. A must have for people in the Industry. </blockquote>
		<p>Shawn Pruitt, Bowles Construction (www.bowlesconstruction.com) (800) 738-9446</p>

		<blockquote>Best course I have taken. I learned a lot of new information, primarily due to the instructor’s experience.</blockquote>
		<p>Anonymous</p>

		<blockquote>Great class with a great instructor!</blockquote>
		<p>Anonymous</p>

		<blockquote>Excellent instructor with a depth of knowledge on investigation and remediation.</blockquote>
		<p>Anonymous</p> 

		<blockquote>This course was informative and helpful to the dealing with IAQ problems.</blockquote>
		<p>Cedric Wilson, Tulane University (www.Tulane.edu) (504) 584-2892 </p>

		<blockquote>Outstanding instructor - excellent course - maximum information transferred into minimum time!</blockquote>
		<p>E. Michael Boyd, URS Corp. (www.urscorp.com) (504) 586-8111</p>



		<h2>CERTIFIED MICROBIAL CONSULTANT (CMC) / INVESTIGATOR (CMI)</h2>


		<blockquote>Excellent study/review course. All aspects covered. Well presented. Informative.</blockquote>
		<p>George Bookis, American Mold Testing Services, LLC (800) 533-0136</p>

		<blockquote>Teaching was Great!</blockquote>
		<p>Steve K. Osborn, American Environmental Engineering, Inc. (www.aee.com) (205) 699-8505</p>

		<blockquote>The class was great. Provided a lot of valuable material. </blockquote>
		<p>Cheri L. McCollum, American Environmental Engineering, Inc. (www.aee.com) (205) 699-8505</p>

		<blockquote>The instructor was very knowledge and open to questions. Good Job NAETI.</blockquote> 
		<p>Mike Cole, EEG, Inc. (479) 968-6767 eegonline.com</p>

		<blockquote>I was extremely impressed with the scientific knowledge and experience of the instructor. A great teacher made this experience extremely enjoyable, interesting, informative and I loved every minute. </blockquote>
		<p>Georgia A. DeJean, URS Corporation (504) 599-5078 </p>

		<h2>1-DAY INSPECTION, TESTING & ASSESSMENT OF MICROBIAL CONTAMINATED BUILDINGS WORKSHOP</h2>

		<blockquote>Very, very informative. This course should be a must have for health officers and inspectors</blockquote>
		<p>Anonymous</p> 

		<blockquote>Looking forward to the next class</blockquote>
		<p>Mark Healy, DCS Professional Services (518) 464-0496</p>

		<h2>1-DAY INDOOR ENVIRONMENTAL QUALITY SAMPLING AND TESTING WORKSHOP</h2>

		<blockquote>Practical advice about about approaching IEQ investigations and practical overview of mold sampling techniques.</blockquote>
		<p>Anonymous</p> 

		<blockquote>Good overall IEQ course. Instructor very knowledgable.</blockquote>
		<p>Glenn Pulliam, New Jersey Dept. of Health & Senior Services (609) 631-6749</p>


		<h2>8-HOUR HAZWOPER REFRESHER br
		Instructor: Don DeCaro</h2>

		<blockquote>Enjoyable class! Excellent instructor! Don brought a lot of real life experiences into the class</blockquote>
		<p>Dana Archer, French & Parrello</p>
		
		
	
	</div>
</div><!-- end inner div for bg color-->')
ContentBlock.create(:name=>"Training Locations", :body=>'<div id="inner">
	<div id="onsite_training" style="padding:15px 20px">
		
		<div id="asset_box">
			<p>If you want to print this page, <a href="#">click here</a></p>

			<p>All courses are held at NAETI\'s Ocean Township, New Jersey location unless otherwise specified. If your company is interested in an on-site training, please contact our office (732) 531-5571 or send an e-mail to <a href="mailto:trainaeti@aol.com"></a>.</p>



			<h2>TRAINING LOCATIONS</h2>
			<h3>New Jersey</h3>

			<p><strong>NAETI</strong> <br>
			3321 Doris Avenue, Building B <br>
			Ocean Township, NJ 07712 <br>
			(732) 531-5571</p>

			<p><strong>New York</strong> <br>
			New York City College of Technology (NYCCT <br>
			300 Jay Street <br>
			Howard Building <br>
			Brooklyn, NY 11201 <br>
			<a href="www.citytechcuny.edu">www.citytechcuny.edu</a></p>

			<p><strong>Hosftra University</strong> <br>
			Hempstead, NY 11549 <br>
			<a href="www.hofstra.edu">www.hofstra.edu</a></p>

			<p><strong>Pennsylvania</strong> <br>
			Infinite Solar <br>
			2880 Comly Road <br>
			Philadelphia, PA 19154 <br>
			<a href="www.lead-certification.com">www.lead-certification.com</a> <br>
			214-464-6460</p>


			<h2>RECOMMENDED HOTELS</h2>

			<h3>New Jersey</h3>

			<p><strong>SHERATON EATONTOWN HOTEL</strong> <br>
			Route 35 at Industrial Way East <br>
			Eatontown, NJ 07724  <br>
			<a href="www.sheraton.com/eatontown">www.sheraton.com/eatontown</a> <br>
			(732) 542-6500</p>


			<p><strong>OCEAN PLACE RESORT AND SPA</strong> <br>
			The Ultimate Meeting Getaway on the Jersey Shore  <br>
			1 Ocean Boulevard <br>
			Long Branch, NJ  <br>
			<a href="www.oceanplaceresort.com">www.oceanplaceresort.com</a> <br>
			(800) 411-7321 <br>
			Ask for the NAETI corporate rate when making a reservation</p>


			<p><strong>STAYBRIDGE SUITES</strong> <br>
			4 Industrial Way East <br>
			Eatontown, NJ  <br>
			<a href="www.sbs-eatontown.com">www.sbs-eatontown.com</a> <br>
			(732) 380-9300 <br>
			Ask for the NAETI corporate rate when making a reservation</p>


			<p><strong>COURTYARD BY MARRIOTT</strong> <br>
			600 Hope Road <br>
			Tinton Falls, NJ <br>
			(800) 647-7561</p>


			<p><strong>RED ROOF INN</strong> <br>
			11 Center Plaza Street (Hope Road) <br>
			Tinton Falls, NJ  <br>
			(800) 843-7663 </p>
			
		</div><!-- end asset_box-->
	</div>
</div><!-- end inner div for bg color-->')