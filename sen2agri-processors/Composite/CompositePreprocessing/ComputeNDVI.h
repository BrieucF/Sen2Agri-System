/*=========================================================================
  *
  * Program:      Sen2agri-Processors
  * Language:     C++
  * Copyright:    2015-2016, CS Romania, office@c-s.ro
  * See COPYRIGHT file for details.
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.

 =========================================================================*/
 
#ifndef COMPUTE_NDVI_H
#define COMPUTE_NDVI_H

#include "otbImage.h"
#include "otbWrapperTypes.h"
#include "otbVectorImage.h"
#include "otbImageFileReader.h"
#include "otbImageFileWriter.h"
#include "itkUnaryFunctorImageFilter.h"
#include "GlobalDefs.h"
#include "ImageResampler.h"

template< class TInput, class TOutput>
class NdviFunctor
{
public:
    NdviFunctor() {}
    ~NdviFunctor() {}
    void Initialize(int nRedBandIdx, int nNirBandIdx) {
        m_nRedBandIdx = nRedBandIdx;
        m_nNirBandIdx = nNirBandIdx;
  }

  bool operator!=( const NdviFunctor & ) const
  {
    return false;
  }
  bool operator==( const NdviFunctor & other ) const
  {
    return !(*this != other);
  }
  inline TOutput operator()( const TInput & A ) const
  {
      TOutput ret;
      double redVal = A[m_nRedBandIdx];
      double nirVal = A[m_nNirBandIdx];
      if((fabs(redVal - NO_DATA_VALUE) < 0.000001) || (fabs(nirVal - NO_DATA_VALUE) < 0.000001)) {
          ret = 0;
      } else {
        if(fabs(redVal + nirVal) < 0.000001) {
            ret = 0;
        } else {
            ret = (nirVal - redVal)/(nirVal+redVal);
        }
      }

      return ret;
  }
private:
  int m_nRedBandIdx;
  int m_nNirBandIdx;
};

class ComputeNDVI
{
public:
    typedef float                                                                   PixelType;
    typedef otb::Image<PixelType, 2>                                                OutputImageType;
    typedef otb::Wrapper::Int16VectorImageType                                      ImageType;
    typedef otb::ImageFileReader<ImageType>                                         ImageReaderType;
    typedef itk::UnaryFunctorImageFilter<ImageType,OutputImageType,
                    NdviFunctor<
                        ImageType::PixelType,
                        OutputImageType::PixelType> > FilterType;
    typedef otb::ImageFileWriter<OutputImageType>      WriterType;
    
public:
    ComputeNDVI();
    void DoInit(std::string &xml, int nRes);
    OutputImageType::Pointer DoExecute();
    const char * GetNameOfClass() { return "ComputeNDVI"; }
    void WriteToOutputFile();

private:
    std::string                         m_inXml;
    ImageReaderType::Pointer            m_InputImageReader;
    int m_nResolution;
    FilterType::Pointer m_Functor;
    ImageResampler<OutputImageType, OutputImageType> m_ResampledBandsExtractor;

};

#endif // COMPUTE_NDVI
